class compute::neutron::config inherits compute::neutron::neutron {

	file { $config_path:
		ensure => file,
		owner => 'neutron',
		group => 'neutron',
		mode => '0644',
		content => template($config_template),
	}
}
