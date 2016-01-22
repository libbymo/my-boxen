class people::libbymo::shell {
  include zsh
  include ohmyzsh

  $dotfiles_dir = hiera('dotfiles_dir')
  $home = "/Users/${::boxen_user}"

  file { "${home}/.oh-my-zsh/custom/themes":
    ensure  => directory,
    require => Class['ohmyzsh']
  }

  repository { "${home}/.oh-my-zsh/custom/themes/sugar-free":
    source => "libbymo/sugar-free",
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

  file { "${home}/.gitconfig":
    ensure  => link,
    target  => "${dotfiles_dir}/.gitconfig",
    require => [
      Repository[$dotfiles_dir]
    ]
  }

  file { "${home}/.gitignore":
    ensure  => link,
    target  => "${dotfiles_dir}/.gitignore",
    require => [
      Repository[$dotfiles_dir]
    ]
  }
}
