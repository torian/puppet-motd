
class motd::params {

	$header = "\n\nPuppet modules:\n===============\n"

	case $::operatingsystem {
		
		/(Debian|Ubuntu)/: {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		/(Redhat|CentOS)/: {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		/(OpenSuSE|SLES)/: {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		'OVS': {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		default: {
			fail("Operating system ${::operatingsystem} not supported yet")
		}
	}
}
