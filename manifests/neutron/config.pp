class compute::neutron::config inherits compute::neutron::neutron {

	file { $config_path:
		ensure => file,
		owner => 'neutron',
		group => 'neutron',
		mode => '0644',
		content => template($config_template),
		require => Package['openstack-neutron-openvswitch'],
	}

	file { 'ml2_conf':
		path => '/etc/neutron/plugins/ml2/ml2_conf.ini',
		ensure => file,
		owner => 'root',
		group => 'neutron',
		mode => '0640',
		content => template('compute/ml2_conf.ini.erb'),
		require => [Package['openstack-neutron-ml2'], Package['openstack-neutron-openvswitch']],
	}

	exec { 'ml2_init':
		command => "ln -s /etc/neutron/plugins/ml2/ml2_conf.ini /etc/neutron/plugin.ini; cp /usr/lib/systemd/system/neutron-openvswitch-agent.service /usr/lib/systemd/system/neutron-openvswitch-agent.service.orig; sed -i \'s,plugins/openvswitch/ovs_neutron_plugin.ini,plugin.ini,g\' /usr/lib/systemd/system/neutron-openvswitch-agent.service",
		path => '/usr/bin',
		require => File['ml2_conf'],
	}

}
