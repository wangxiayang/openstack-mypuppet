class compute::ntp::ntp inherits compute {
	
	include compute::ntp::params

	$verbose = $compute::ntp::params::verbose
	$package_name = $compute::ntp::params::package_name
	$config_path = $compute::ntp::params::config_path
	$config_template = $compute::ntp::params::config_template
	$service_manage = $compute::ntp::params::service_manage
	$service_name = $compute::ntp::params::service_name

	anchor { 'compute::ntp::begin': } ->
		class { 'compute::ntp::install': } ->
		class { 'compute::ntp::config': } ->
		class { 'compute::ntp::service': } ->
	anchor { 'compute::ntp::end': }
}
