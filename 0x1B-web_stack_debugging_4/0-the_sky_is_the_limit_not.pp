# Increase the amount of traffic of an Nginx server

# Increase the VLIMIT of the file
exec {'fix--nginx-limit':
  # modify the VLIMIT value
  command => '/bin/sed -i "s/15/4444096/" /etc/default/nginx',
  # specify the path for sed command
  path    => '/usr/local/bin/:/bin/',
}

# Restart nginx
exec {'nginx-restart':
  # restart nginx service
  command => '/etc/init.d/nginx restart',
  # specify the path for init.d script
  path    => '/etc/init.d/',
}
