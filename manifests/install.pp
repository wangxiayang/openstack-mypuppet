class compute::install inherits compute {

	if $compute::package_manage {

		package { 'yum-plugin-priorities':
			ensure => $package_ensure,
		}

		package { 'epel-release':
			provider => rpm,
			ensure => $package_ensure,
			# 'source' should be set in init with a check on os type
			source => 'http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm',
		}

		package { 'rdo-release':
			provider => rpm,
			ensure => $package_ensure,
			source => 'http://rdo.fedorapeople.org/openstack-juno/rdo-release-juno.rpm',
		}

		package { 'openstack-selinux':
			ensure => $package_ensure,
		}
	}
}
