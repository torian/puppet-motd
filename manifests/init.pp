# Class: motd
#
#   This module is used to include usefull
#   information on motd
#
#   This code is mainly borrowed from puppet-concat
#   example, but it served me as the first TDD / BDD
#   test using rspec.
#
#   Emiliano Castagnari (torian) <ecastag@gmail.com>
#   2013/02/27
#
# Tested platforms:
#
#	- Debian: squeeze / Wheezy
#
# Parameters:
#
#	None
#
# Requires:
#
#	puppet-concat (concat) - https://github.com/ripienaar/puppet-concat
#
# Sample Usage:
#
#   class mymodule {
#
#     # ...
#     include motd
#     motd::register { 'MyModule': }
#     
#   }
# 
class motd {

	include concat::setup
	include motd::params

	concat { $motd::params::motd:
		owner => 'root',
		group => 'root',
		mode  => 0644
	}

	# Preserve local motd information
	concat::fragment { 'motd::local':
		target  => $motd::params::motd,
		ensure  => $motd::params::local,
		#source  => '/etc/motd',
		order   => '00'
	}
	
	concat::fragment { 'motd::header':
		target  => $motd::params::motd,
		content => $motd::params::header,
		order   => '50'
	}

} 
