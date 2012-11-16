class base {
  if $sshd_config == undef {
    $sshd_config = 'sshd_config'
  }
  include ssh
  include sudo

  package { 'puppet':
    ensure => latest,
  }

}
