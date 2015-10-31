class compute::nova::service inherits compute::nova::nova {

	service { 'libvirtd':
		ensure => $service_ensure,
		enable => $service_enable,
	}

	service { $service_name:
		ensure => $service_ensure,
		enable => $service_enable,
		require => File[$config_path],
	}

}
