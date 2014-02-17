
class motd::params {

	$header = "\n\nPuppet modules:\n===============\n"

	case $::operatingsystem {
		
		/(?i:Debian|Ubuntu)/: {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		/(?i:Redhat|CentOS)/: {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		/(?i:OpenSuSE|SLES)/: {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		'OVS': {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		'AIX': {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		default: {
			fail("Operating system ${::operatingsystem} not supported yet")
		}
	}
}
