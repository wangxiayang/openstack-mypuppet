class compute::preinstall inherits compute {
	# set /etc/hosts
	file { '/etc/hosts':
		ensure => file,
		owner => 'root',
		group => 'root',
		mode => '0644',
		content => template('compute/hosts.erb'),
	}
	# ensure connection

	# directly use iptables to control netfilter
	service { 'firewalld':
		enable => $service_disable,
		ensure => $servicestop_ensure,
	}

	# enable iptables
	package { 'iptables-services':
		ensure => $package_ensure,
	}

	file { '/etc/sysconfig/iptables':
		ensure => file,
		owner => 'root',
		group => 'root',
		mode => '0644',
		content => template('compute/iptables.erb'),
		require => Package['iptables-services'],
		# neutron-agent should also be notified
		notify => Service['iptables'],
	}

	service { 'iptables':
		enable => $service_enable,
		ensure => $service_ensure,
		require => Package['iptables-services'],
	}

}
