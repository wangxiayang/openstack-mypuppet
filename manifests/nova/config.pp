class compute::nova::config inherits compute::nova::nova {

	file { $config_path:
		ensure => file,
		owner => 'nova',
		group => 'nova',
		mode => '0644',
		content => template($config_template),
	}
}
