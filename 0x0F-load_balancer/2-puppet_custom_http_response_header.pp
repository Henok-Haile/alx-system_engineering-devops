# Update package repositories
exec { 'update':
  command => '/usr/bin/apt-get update',
}

# Install Nginx package
package { 'nginx':
  ensure => 'present',
  require => Exec['update'],
}

# Add custom HTTP header to Nginx configuration
file_line { 'http_header':
  path  => '/etc/nginx/nginx.conf',
  line  => 'add_header X-Served-By $hostname;',
  match => '^http {',
  notify => Exec['restart_nginx'],
}

# Restart Nginx service when configuration changes
exec { 'restart_nginx':
  command     => '/usr/sbin/service nginx restart',
  refreshonly => true,
  subscribe   => File_line['http_header'],
}
