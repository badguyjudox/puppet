node 'puppet.scottbrimhall.com' {
  include ssh
  include sudo

  package { 'puppet-server':
    ensure => latest,
  }

  package { 'puppet':
    ensure => latest,
  }

  service { 'puppetmaster':
    ensure => running,
  }

}
