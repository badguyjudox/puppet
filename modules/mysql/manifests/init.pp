class mysql {

  package { 'mysql':
    ensure => installed,
  }

  package { 'mysql-devel':
    ensure => installed,
  }
  
  package { 'mysql-server':
    ensure => installed,
  }
  
  file { '/etc/my.cnf':
    ensure  => file,
    mode    => 0644,
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/mysql/$my_cnf",
    require => Package['mysql-server'],
  }
  
  service { 'mysqld':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['mysql-server'],
    subscribe  => [File['/etc/my.cnf'], Package['mysql-server']],
  }
}
