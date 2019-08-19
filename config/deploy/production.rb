server '3.113.229.20', user: 'app', roles: %w{app db web}
ssh_options: { keys: %w(~/.ssh/id_rsa_bc:96:5e:a6:14:fc:80:91:4f:6f:02:e0:45:92:47:2c), forward_agent: true}
