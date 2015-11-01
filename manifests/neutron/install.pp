class compute::neutron::install inherits compute::neutron::neutron {

	package { 'openstack-neutron-ml2':
		ensure => $package_ensure,
		require => [Package['rdo-release'],
			Package['epel-release'],
			Package['yum-plugin-priorities']],
	}

	package { 'openstack-neutron-openvswitch':
		ensure => $package_ensure,
		require => [Package['rdo-release'],
			Package['epel-release'],
			Package['yum-plugin-priorities']],
	}
}
