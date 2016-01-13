class people::libbymo::apps {
  package { 'iterm2'  : provider => 'brewcask'}
  package { 'java'    : provider => 'brewcask'}

  homebrew::tap { 'caskroom/versions': }

  # Error installing Sublime Text 3 via brew cask, even manually around permissions.
  # and or actually getting the app into the cask cellar location.
  # Installed this manually. 
  package { 'sublime-text3'         : provider => 'brewcask' }
  package { 'firefox-nightly'       : provider => 'brewcask' }
  package { 'hipchat'      	 		: provider => 'brewcask' }
  package { 'charles'      	 		: provider => 'brewcask' }
  package { 'tunnelblick'			: provider => 'brewcask' }
  package { 'caffeine'				: provider => 'brewcask' }
  package { 'spotify'				: provider => 'brewcask' }
  package { 'moom'					: provider => 'brewcask' }
  package { 'intellij-idea'			: provider => 'brewcask' }
  # installs latest, version 8 currently licensed.
  package { 'vmware-fusion'      	: provider => 'brewcask' }
}
