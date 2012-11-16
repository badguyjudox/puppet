class minecraft {
  include mysql

  file { '/usr/bin/cleanup-dumps':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => 0755,
    source => 'puppet:///modules/minecraft/usr_bin_cleanup-dumps',
  }

  file { '/etc/cron.d/logblock':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => 0644,
    source => 'puppet:///modules/minecraft/etc_cron.d_logblock',
  }
  
  file { '/etc/cron.d/mcbackup':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => 0644,
    source => 'puppet:///modules/minecraft/etc_cron.d_mcbackup',
  }

}
