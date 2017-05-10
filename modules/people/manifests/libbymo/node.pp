class people::libbymo::node {

  nodejs::version { '0.12.7': }
  nodejs::version { '4.6.1': }
  nodejs::version { '6.9.1': }

  # See all available versions with `nodenv install --list'
  # If the version you need is missing, try upgrading node-build:
  # `cd /opt/boxen/node-build && git pull && cd -`
  class { 'nodejs::global':
    version => '4.6.1'
  }

  npm_module { "npm for all installed node versions":
    module       => 'npm',
    ensure       => 'present',
    node_version => '*'
  }

  npm_module { "bower for all installed node versions":
    module       => 'bower',
    ensure       => 'present',
    node_version => '*'
  }

  npm_module { "phantomjs for installed node versions":
    module       => 'phantomjs',
    ensure       => 'present',
    node_version => '*'
  }

  npm_module { "grunt for installed node versions":
    module       => 'grunt-cli',
    ensure       => 'present',
    node_version => '*'
  }

  # installation of ember-cli for node version 5.x.x seems to fail,
  # so only install for default node version 4.2.4
  npm_module { "ember-cli for ${nodejs::global::version}":
    module       => 'ember-cli',
    ensure       => 'present',
    version      => '1.13.13',
    node_version => "${nodejs::global::version}"
  }
}
