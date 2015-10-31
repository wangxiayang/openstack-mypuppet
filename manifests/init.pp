class neutron {

	include neutron::params

	# params in conf file
	$verbose = $neutron::params::verbose
	# params used by puppet
	$package_manage = $neutron::params::package_manage
	$package_name = $neutron::params::package_name
	$config_path = $neutron::params::config_path
	$config_template = 'neutron/neutron.conf.erb'

	# some validation operation
	validate_bool($verbose)
	validate_bool($package_manage)
	validate_array($package_name)
	validate_absolute_path($config_path)

	# notifications
	if $verbose {
		notice('Verbose has been turned on.')
	}

	# connect all actions
	anchor { 'neutron::begin': } ->
		class { 'neutron::install': } ->
		class { 'neutron::config': } ->
		#class {'neutron::service': } ->
	anchor { 'neutron::end': }
}
