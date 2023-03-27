package { 'nginx':
  ensure => 'installed'
}

file { '/var/www/html/index.html':
  content => 'Hello World',
}

file_line { 'redirection-301':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://m.youtube.com/watch?v=aXOChLn5ZdQ&t=65s  permanent;',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
