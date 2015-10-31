class compute::ntp::params {

	$verbose = true
	$package_name = ['ntp']
	$config_path = '/etc/ntp.conf'
	$config_template = 'compute/ntp.conf.erb'
	$service_manage = true
	$service_name = 'ntpd'

}
