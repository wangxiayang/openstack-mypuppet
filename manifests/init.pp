class compute {

	include compute::params

	# params used by puppet
	$package_manage = $compute::params::package_manage

	# params in conf file
	$verbose = $compute::params::verbose
	$controller_hostname = $compute::params::controller_hostname
	$controller_ip = $compute::params::controller_ip

	# some validation operation
	validate_bool($verbose)
	validate_bool($package_manage)

	require compute::ntp::ntp

	# connect all actions
	anchor { 'compute::begin': } ->
		#class { 'compute::pre-install': } ->
		class { 'compute::install': } ->
		class { 'compute::neutron::neutron': } ->
	anchor { 'compute::end': }
}
