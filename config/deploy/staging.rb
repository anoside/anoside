set :branch,    'staging'
set :deploy_to, '/var/www/anoside'
set :rails_env, 'staging'
set :user,      'root' # SSH

server '192.168.33.10', :app, :web, :db, primary: true
