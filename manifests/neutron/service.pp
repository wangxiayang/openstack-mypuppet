class compute::neutron::service inherits compute::neutron::neutron {

	service { 'openvswitch':
		ensure => $service_ensure,
		enable => $service_enable,
		require => File['ml2_conf'],
	}

	service { $service_name:
		ensure => $service_ensure,
		enable => $service_enable,
		require => [File[$config_path], Service['openvswitch'], Exec['ml2_init']],
		subscribe => [File[$config_path], File['ml2_conf'], Service['iptables']],
	}

}
