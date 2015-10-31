class neutron::install inherits neutron {

	if $neutron::package_manage {

		package { $neutron::package_name:
			ensure => 'present',
		}
	}
}
