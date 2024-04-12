#!/usr/bin/env bash
# Configuration client to connect without password using puppet

file { '/etc/ssh/ssh_config':
  ensure  => file,
  content => "

	# Global settings
	Host *
	PasswordAuthentication no
	IdentityFile ~/.ssh/school
	"
}
