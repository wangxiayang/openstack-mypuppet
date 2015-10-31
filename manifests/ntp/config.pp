class compute::ntp::config inherits compute::ntp::ntp {

	file { $config_path:
		ensure => file,
		owner => 'root',
		group => 'root',
		mode => '0644',
		content => template($config_template),
		notify => Service[$service_name],
	}
}
