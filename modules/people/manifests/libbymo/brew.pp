class people::libbymo::brew {
	# package { 'postgresql' :
	# 	provider => 'homebrew',
	# 	ensure => '9.5.0' }
	package { 'leiningen' : provider => 'homebrew'}
	package { 'tree'     : provider => 'homebrew' }
  	package { 'watchman' : provider => 'homebrew' }
  	package { 'httpie' : provider => 'homebrew' }
  	package { 'jq' : provider => 'homebrew' }
    package { 'postgresql94': provider => 'homebrew'}
}
