class compute::nova::nova inherits compute {

	include compute::nova::params
	
	$package_name = $compute::nova::params::package_name
	$config_path = $compute::nova::params::config_path
	$config_template = 'compute/nova.conf.erb'
	$service_name = $compute::nova::params::service_name

	# params used in nova.conf
	$verbose = $compute::nova::params::verbose
	$state_path = $compute::nova::params::state_path

	validate_array($package_name)
	validate_absolute_path($config_path)

	# connect all actions
	anchor { 'compute::nova::begin': } ->
		class { 'compute::nova::install': } ->
		class { 'compute::nova::config': } ->
		class {'compute::nova::service': } ->
	anchor { 'compute::nova::end': }
}
