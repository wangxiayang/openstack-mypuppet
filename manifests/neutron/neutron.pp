class compute::neutron::neutron inherits compute {

	include compute::neutron::params
	
	$config_path = $compute::neutron::params::config_path
	$config_template = 'compute/neutron.conf.erb'
	$service_name = $compute::neutron::params::service_name

	# params used in neutron.conf
	$verbose = $compute::neutron::params::verbose

	validate_absolute_path($config_path)

	# connect all actions
	anchor { 'compute::neutron::begin': } ->
		class { 'compute::neutron::preinstall': } ->
		class { 'compute::neutron::install': } ->
		class { 'compute::neutron::config': } ->
		class {'compute::neutron::service': } ->
	anchor { 'compute::neutron::end': }
}
