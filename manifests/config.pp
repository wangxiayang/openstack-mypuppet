class neutron::config inherits neutron {

	file { $neutron::config_path:
		ensure => file,
		owner => 'neutron',
		group => 'neutron',
		mode => '0644',
		content => template($neutron::config_template),
	}
}
