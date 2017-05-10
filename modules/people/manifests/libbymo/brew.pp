class people::libbymo::brew {
  package { 'gettext'   : provider => 'homebrew' }
	package { 'leiningen' : provider => 'homebrew'}
	package { 'tree'     : provider => 'homebrew' }
	package { 'watchman' : provider => 'homebrew' }
	package { 'httpie' : provider => 'homebrew' }
	package { 'jq' : provider => 'homebrew' }
  package { 'postgresql94': provider => 'homebrew'}

  # gettext is keg-only and so not symlinked
  exec { 'brew_link_gettext':
    command => 'brew link gettext --force',
    require => Package['gettext']
  }
}
