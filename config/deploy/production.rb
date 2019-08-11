server '3.113.229.20', user: 'app', roles: %w{app db web}
set :ssh_options, keys: [File.expand_path('/Users/t_kodama/.ssh/id_rsa.pem)')]
