class sudo {

  package { 'sudo':
    ensure => installed,
  }

  $sudoers_file = $::operatingsystemrelease ? {
    5.8     => 'c5_sudoers',
    6.3     => 'c6_sudoers',
    default => 'sudoers',
  }

  file { '/etc/sudoers':
    ensure => file,
    mode   => 0440,
    source => "puppet:///modules/sudo/${sudoers_file}",
  }
}
