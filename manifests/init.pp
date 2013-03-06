# Class: motd
#
#   This module is used to include usefull
#   information on motd
#
#   Emiliano Castagnari (torian) <ecastag@gmail.com>
#   2013/02/27
#
#   Tested platforms:
#
# Parameters:
#
#	TODO
#
# Actions:
#
#	TODO
#
# Requires:
#
#	puppet-concat (concat) - https://github.com/ripienaar/pppppuuuuuuuuuuuppet-concat
#
# Sample Usage:
#
#	TODO
#
class motd {

	include concat::setup
	include motd::params

	concat { $motd::params::motd:
		owner => 'root',
		group => 'root',
		mode  => 0644
	}

	concat::fragment { 'motd::header':
		target  => $motd::params::motd,
		content => $motd::params::header,
		order   => '01'
	}

	concat::fragment { 'motd::local':
		target  => $motd::params::motd,
		ensure  => $motd::params::local,
		order   => 15
	}
} 
