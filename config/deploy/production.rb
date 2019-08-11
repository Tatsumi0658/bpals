server '3.113.229.20', user: 'app', roles: %w{app db web}
set :ssh_options, { forward_agent: true, user: fetch(:user), keys: '~/.ssh/id_rsa' }
