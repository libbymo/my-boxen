class people::libbymo::brew {
	package { 'postgresql' : 
		provider => 'homebrew',
		ensure => '9.5.0' }
}