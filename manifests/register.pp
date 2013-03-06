
define motd::register($content = '', $order = 14) {

	include motd::params	
	
	concat::fragment { "motd::fragment::${name}":
		target  => $motd::params::motd,
		content => $content ? {
				''      => "	- ${name}",
				default => "	- ${content}",
				},
		order   => $order
	}
} 

