class compute::ntp::install inherits compute::ntp::ntp {

	package { $package_name:
		ensure => $package_ensure,
	}

}
