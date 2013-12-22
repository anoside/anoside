set :branch,    'master'
set :deploy_to, '/var/apps/anoside'
set :rails_env, 'staging'
set :user,      'root' # SSH

server '192.168.11.14', :app, :web, :db, primary: true
