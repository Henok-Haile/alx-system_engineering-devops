# configuring nginx using puppet automation

exec { 'update packages':
  command => 'apt-get update',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

package { 'nginx':
  ensure => installed,
}

file_line { 'install':
  ensure => 'present',
  path   => '/etc/nginx/sites-enabled/default',
  after  => 'listen 80 default_server;',
  line   => 'rewirte ^/redirect_me https://www.github.com/Henok-Haile permanent;',
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

exec { 'restart service':
  command => 'service nginx restart',
  path    => '/usr/bin:/usr/sbin:/bin',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
