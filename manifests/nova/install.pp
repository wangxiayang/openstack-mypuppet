class compute::nova::install inherits compute::nova::nova {

	package { $package_name:
		ensure => $package_ensure,
		require => [Package['rdo-release'],
			Package['epel-release'],
			Package['yum-plugin-priorities']],
	}

	package { 'sysfsutils':
		ensure => $package_ensure,
	}

}
