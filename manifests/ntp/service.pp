class compute::ntp::service inherits compute::ntp::ntp {
	if $service_manage {
		service { $service_name:
			ensure => $service_ensure,
			enable => $service_enable,
		}
	}
}
