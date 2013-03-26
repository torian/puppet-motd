
define motd::register($content = '', $order = 51) {

	include motd::params	
	
	concat::fragment { "motd::fragment::${name}":
		target  => $motd::params::motd,
		content => $content ? {
				''      => "	- ${name}\n",
				default => "	- ${content}\n",
				},
		order   => $order
	}
} 

