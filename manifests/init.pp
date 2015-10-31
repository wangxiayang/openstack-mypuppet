class neutron (
	# params in conf file
	$verbose = $neutron::params::verbose,
	# params used by puppet
	$package_manage = $neutron::params::package_manage,
	$package_name = $neutron::params::package_name,
	$config_path = $neutron::params::config_path,
	$config_template = 'neutron/neutron.conf.erb',
) {

	include neutron::params

	# some validation operation
	#validate_bool($verbose)
	#validate_bool($package_manage)
	#validate_array($package_name)
	#validate_absolute_path($config_path)

	# notifications
	if $verbose {
		notice('Verbose has been turned on.')
	}

	# connect all actions
	Anchor['neutron::begin'] ->
		Class['neutron::install'] ->
		Class['neutron::config'] ->
		#Class['neutron::service'] ->
	Anchor['neutron::end']
}
