# config valid only for current version of Capistrano
lock "3.8.2"

set :application, "politota"
set :repo_url, "git@github.com:ssnake/politota.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
set :branch, :master
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/snake/projects/politota'
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "puma.conf"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

#append :linked_files, '.env'
# set :pty, true
# set :ssh_options, {:forward_agent => true}
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/puma', 'tmp/sockets', 'public/system', 'certs'

set :rails_env, 'production'

set :puma_state, "#{shared_path}/tmp/puma/state"
set :puma_pid, "#{shared_path}/tmp/puma/pid"
set :puma_preload_app, true
set :puma_conf, "#{shared_path}/puma.conf"

set :lets_encrypt_roles, :web
set :lets_encrypt_user, 'snake'
set :lets_encrypt_email, 'max.nedelchev@gmail.com'
set :lets_encrypt_account_key, "~/#{fetch(:lets_encrypt_email)}.account_key.pem"
set :lets_encrypt_challenge_public_path, "#{release_path}/public"
set :lets_encrypt_output_path, '/etc/nginx/ssl'
set :lets_encrypt_local_output_path, '~/certs'
set :lets_encrypt_days_valid, 90