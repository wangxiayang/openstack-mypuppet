class compute::neutron::neutron inherits compute {

	include compute::neutron::params
	
	$package_name = $compute::neutron::params::package_name
	$config_path = $compute::neutron::params::config_path
	$config_template = 'compute/neutron.conf.erb'

	validate_array($package_name)
	validate_absolute_path($config_path)

	# connect all actions
	anchor { 'compute::neutron::begin': } ->
		class { 'compute::neutron::install': } ->
		class { 'compute::neutron::config': } ->
		#class {'compute::neutron::service': } ->
	anchor { 'compute::neutron::end': }
}
