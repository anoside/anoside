set :branch,    'master'
set :deploy_to, '/var/www/anoside'
set :rails_env, 'production'
set :user,      'root' # SSH

server '192.168.11.13', :app, :web, :db, primary: true
