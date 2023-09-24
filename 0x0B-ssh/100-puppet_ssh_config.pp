# Configuration client to connect without password using puppet
include stdlib

file_line {'Disable password authentication':
ensure  => present,
path    => '/etc/ssh/ssh_config',
line    => 'PasswordAuthentication no',
replace => true
}

file_line {'Set SSH identity file to ~/.ssh/school':
ensure  => present,
path    => '/etc/ssh/ssh_config',
line    => 'IdentityFile ~/.ssh/school',
replace => true
}
