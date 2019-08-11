server '3.113.229.20', user: 'app', roles: %w{app db web}
set :ssh_options,{ keys: keys: '~/.ssh/bpals-key.pem'}
