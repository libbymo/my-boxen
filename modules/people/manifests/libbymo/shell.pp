class people::libbymo::shell {
  include zsh
  include ohmyzsh

  $dotfiles_dir = hiera('dotfiles_dir')
  $home = "/Users/${::boxen_user}"

  file { "${home}/.oh-my-zsh/custom/themes":
    ensure  => directory,
    require => Class['ohmyzsh']
  }

  file { "${home}/.zshrc":
    ensure  => link,
    target  => "${dotfiles_dir}/.zshrc",
    require => [
      Repository[$dotfiles_dir],
      Class['zsh']
    ]
  }
}
