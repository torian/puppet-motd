
class motd::params {

	$header = "\n\nPuppet modules:\n===============\n"

	case $::operatingsystem {
		
		'Debian': {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		'Redhat': {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		'OVS': {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		/(OpenSuSE|SLES)/: {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		default: {
			fail("Operating system ${::operatingsystem} not supported yet")
		}
	}
}
