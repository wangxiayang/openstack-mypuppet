class neutron::install inherits neutron {

	if $neutron::package_manage {

		package { 'rdo-release':
			ensure => 'present',
			name => 'http://rdo.fedorapeople.org/openstack-juno/rdo-release-juno.rpm',
		}

		package { $neutron::package_name:
			ensure => 'present',
			require => Package['rdo-release'],
		}
	}
}
