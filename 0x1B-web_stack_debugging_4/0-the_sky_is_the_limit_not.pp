# Increase the amount of traffic an Nginx server can handle

#Increase the ULIMIY of the default file
exec { 'fix--for-nginx': command => 'sed -i "s/15/4096/" /etcdefault/nginx', path => '/usr/local/bin/:/bin/'
} ->

# Restart Nginx
exec {'nginx-restart': command => 'nginx restart', path => '/etc/init.d/'}
