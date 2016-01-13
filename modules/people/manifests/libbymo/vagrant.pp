class people::libbymo::vagrant {
	include vagrant

	vagrant::plugin { 'vagrant-vmware-fusion' :
		version => '4.0.6'
	}
}