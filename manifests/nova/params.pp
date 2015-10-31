class compute::nova::params {

	$package_name = ['openstack-nova-compute']
	$config_path = '/etc/nova/nova.conf'
	$service_name = 'openstack-nova-compute'
	
	$verbose = false
	$state_path = '/var/lib/nova'
	
}
