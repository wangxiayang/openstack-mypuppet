class compute::neutron::preinstall inherits compute::neutron::neutron {

	file_line { 'allfilter':
		path => '/etc/sysctl.conf',
		line => 'net.ipv4.conf.all.rp_filter=0',
	}

	file_line { 'defaultfilter':
		path => '/etc/sysctl.conf',
		line => 'net.ipv4.conf.default.rp_filter=0',
	}

	exec { 'sysctl':
		command => 'sysctl -p',
		path => '/usr/sbin',
		require => [File_line['allfilter'], File_line['defaultfilter']],
	}
}
