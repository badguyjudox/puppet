class ssh {
  include skbrimhall

  if $sshd_config == undef {
    $sshd_config = 'sshd_config'
  }  

  package { 'openssh':
    ensure => latest,
  }
  
  file { '/etc/ssh/sshd_config':
    ensure  => file,
    mode    => 0600,
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/ssh/$sshd_config",
    require => Package['openssh'],
  }
  
  service { 'sshd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['openssh'],
    subscribe  => [File['/etc/ssh/sshd_config'], Package['openssh']],
  }
}
