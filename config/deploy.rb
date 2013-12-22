require 'bundler/capistrano'
require 'capistrano/ext/multistage'
require 'capistrano-unicorn'
require 'rvm/capistrano'
require 'sidekiq/capistrano'

set :application,     'anoside'
set :deploy_via,      :remote_cache
set :repository,      "git@github.com:anoside/#{application}.git"
set :rvm_ruby_string, "ruby-2.0.0-p353@#{application}"
set :rvm_type,        :system
set :scm,             :git
set :user,            'root'
set :use_sudo,        false

ssh_options[:forward_agent] = true
default_run_options[:pty]   = true

set :default_environment, {
  'PATH'   => '/usr/local/bin:$PATH',
  'LANG'   => 'en_US.UTF-8',
  'LC_ALL' => 'en_US.UTF-8'
}

namespace :deploy do
  task :copy_yml_files do
    %w[database.yml newrelic.yml].each do |file_name|
      run "cp #{shared_path}/settings/#{file_name} #{release_path}/config/"
    end

    run "cp #{shared_path}/settings/#{rails_env}.yml #{release_path}/config/settings/"
  end
end

after 'bundle:install', 'deploy:copy_yml_files'
after 'bundle:install', 'deploy:migrate'
after 'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'   # app preloaded
after 'deploy:restart', 'unicorn:duplicate' # before_fork hook implemented (zero downtime deployments)
after 'deploy:restart', 'deploy:cleanup'
