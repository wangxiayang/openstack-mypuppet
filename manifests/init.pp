class compute {

	include compute::params

	# params used by puppet
	$package_manage = $compute::params::package_manage
	$service_enable = $compute::params::service_enable
	$service_disable = $compute::params::service_disable
	$service_ensure = $compute::params::service_ensure
	$servicestop_ensure = $compute::params::servicestop_ensure

	# params in conf file
	$verbose = $compute::params::verbose
	$controller_hostname = $compute::params::controller_hostname
	$controller_ip = $compute::params::controller_ip
	$master_hostname = 'centos-main'
	$master_ip = $controller_ip
	$rabbit_password = 'root'
	$default_interface = 'eno67109432'
	$my_ip = inline_template("<%= scope.lookupvar('::ipaddress_${default_interface}') -%>")
	$glance_hostname = $controller_hostname
	$neutron_password = 'root'
	$nova_password = 'root'

	# some validation operation
	validate_bool($verbose)
	validate_bool($package_manage)

	require compute::ntp::ntp

	# connect all actions
	anchor { 'compute::begin': } ->
		class { 'compute::preinstall': } ->
		class { 'compute::install': } ->
		class { 'compute::nova::nova': } ->
		class { 'compute::neutron::neutron': } ->
	anchor { 'compute::end': }
}
