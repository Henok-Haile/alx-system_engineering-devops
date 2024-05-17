# Ensure the holberton user has the hard file limit set correctly
exec { 'ensure-hard-file-limit-for-holberton-user':
  command => "grep -q '^holberton.*hard.*nofile' /etc/security/limits.conf || echo 'holberton hard nofile 50000' >> /etc/security/limits.conf",
  path    => '/usr/local/bin:/bin:/usr/bin',
}

exec { 'increase-hard-file-limit-for-holberton-user':
  command => "sed -i '/^holberton.*hard.*nofile/s/[0-9]\\+/50000/' /etc/security/limits.conf",
  path    => '/usr/local/bin:/bin:/usr/bin',
  require => Exec['ensure-hard-file-limit-for-holberton-user'],
}

# Ensure the holberton user has the soft file limit set correctly
exec { 'ensure-soft-file-limit-for-holberton-user':
  command => "grep -q '^holberton.*soft.*nofile' /etc/security/limits.conf || echo 'holberton soft nofile 50000' >> /etc/security/limits.conf",
  path    => '/usr/local/bin:/bin:/usr/bin',
}

exec { 'increase-soft-file-limit-for-holberton-user':
  command => "sed -i '/^holberton.*soft.*nofile/s/[0-9]\\+/50000/' /etc/security/limits.conf",
  path    => '/usr/local/bin:/bin:/usr/bin',
  require => Exec['ensure-soft-file-limit-for-holberton-user'],
}
