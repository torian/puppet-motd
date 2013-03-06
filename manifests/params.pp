
class motd::params {

	$header = "\n\nPuppet modules:\n============="

	case $::operatingsystem {
		
		Debian: {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		Redhat: {
			$motd       = '/etc/motd'
			$motd_local = '/etc/motd.local'
		}

		default: {
			fail("Operating system ${::operatingsystem} not supported yet")
		}
	}
}
