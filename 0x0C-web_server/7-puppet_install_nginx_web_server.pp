# configuring nginx using puppet automation

package {'nginx':
  ensure => 'present',
}

exec {'install':
  command => 'sudo apt-get update -y; sudo apt-get -y install nginx',
  provider => shell,
}

file_line {'install':
  ensure => 'present',
  path => '/etc/nginx/sites-available/default',
  after => 'listen 80 default_server;',
  line => 'rewrite ^/redirect_me https://www.github.com/Henok-Haile permanent;',
}

file {'index.html':
  path => '/var/www/html/index.html',
  content => 'Hello World!',
}

service {'nginx':
  ensure => running,
  require => Package['nginx'],
}
