class people::libbymo::apps {
  package { 'iterm2'  : provider => 'brewcask'}
  package { 'java'    : provider => 'brewcask'}

  homebrew::tap { 'caskroom/versions': }

  package { 'sublime-text3'         : provider => 'brewcask' }
  package { 'firefox-nightly'       : provider => 'brewcask' }
}
