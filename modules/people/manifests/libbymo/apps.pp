class people::libbymo::apps {
  $dotfiles_dir = hiera('dotfiles_dir')

  package { 'iterm2'                : provider => 'brewcask'}

  # Because I install java this way, jruby is not
  # installable via a module as there's a dep on the java puppet module
  # currently the puppet module doesn't support java 8.
  package { 'java'    : provider => 'brewcask'}

  homebrew::tap { 'caskroom/versions': }

  # Error installing Sublime Text 3 via brew cask, even manually around permissions.
  # and or actually getting the app into the cask cellar location.
  # Installed this manually.
  package { 'sublime-text3'         : provider => 'brewcask' }
  package { 'firefox-nightly'       : provider => 'brewcask' }
  package { 'hipchat'      	 	      : provider => 'brewcask' }
  package { 'charles'      	 	      : provider => 'brewcask' }
  package { 'tunnelblick'           : provider => 'brewcask' }
  package { 'spotify'               : provider => 'brewcask' }
  package { 'intellij-idea'         : provider => 'brewcask' }
  # package { 'alfred'                : provider => 'brewcask' }
  package { 'spectacle'             : provider => 'brewcask' }

  # installs latest, version 8 currently licensed.
  package { 'vmware-fusion'      	: provider => 'brewcask' }


  # sublime text
  ## We're installing via brew cask, but using sublime_text_3::package to install packages

  # taken from https://github.com/jozefizso/puppet-sublime_text_3/blob/master/manifests/config.pp
  $dir = "/Users/${::boxen_user}/Library/Application Support/Sublime Text 3"
  $packages_dir = "${dir}/Packages"
  $user_packages_dir = "${packages_dir}/User"
  $installed_packages_dir = "${dir}/Installed Packages"

  file { [
    $dir,
    $packages_dir,
    $user_packages_dir,
    $installed_packages_dir
  ]:
    ensure => directory,
    require => Package['sublime-text3']
  }

  ## settings
  file { "${user_packages_dir}/Preferences.sublime-settings" :
    ensure  => link,
    mode    => '0644',
    target  => "/Users/${::boxen_user}/dotfiles/Preferences.sublime-settings",
    require => [Repository["${dotfiles_dir}"],
                File[$user_packages_dir]]
  }

  ## packages

  include sublime_text_3::package_control

  sublime_text_3::package { 'EditorConfig':
    source => 'sindresorhus/editorconfig-sublime',
    require => Package['sublime-text3']
  }

  sublime_text_3::package { 'SublimePuppet':
    source => 'russCloak/SublimePuppet',
    require => Package['sublime-text3']
  }

  ## theme

  sublime_text_3::package { 'zenburn' :
    source => 'https://github.com/colinta/zenburn',
    require => Package['sublime-text3']
  }
}
