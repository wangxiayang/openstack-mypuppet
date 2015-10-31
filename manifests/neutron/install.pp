class compute::neutron::install inherits compute::neutron::neutron {

	if $compute::package_manage {

		package { $package_name:
			ensure => $package_ensure,
			require => [Package['rdo-release'],
				Package['epel-release'],
				Package['yum-plugin-priorities']],
		}
	}
}
