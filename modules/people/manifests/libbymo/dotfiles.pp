class people::libbymo::dotfiles {
  $dotfiles_dir = hiera('dotfiles_dir')

  repository { "${dotfiles_dir}":
    source => 'libbymo/dotfiles',
  }
}