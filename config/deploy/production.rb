server '3.113.229.20', user: 'app', roles: %w{app db web}
set :ssh_options, { forward_agent: true, user: fetch(:user), keys: [File.expand_path('~/.ssh/id_rsa')] }
