server '3.113.229.20', user: 'app', roles: %w{app db web}
set :ssh_options { keys: %w(~/.ssh/id_rsa), forward_agent: true, auth_methods: %w(publickey) }
