class skbrimhall {

  file { '/home/skbrimhall/.ssh':
    ensure => directory,
    owner  => 'skbrimhall',
    group  => 'skbrimhall',
    mode   => 0700,
  }

  file { '/home/skbrimhall/.ssh/authorized_keys':
    ensure => file,
    owner  => 'skbrimhall',
    group  => 'skbrimhall',
    mode   => 0600,
    source => 'puppet:///modules/ssh/skbrimhall_authorized_keys',
  }
}
