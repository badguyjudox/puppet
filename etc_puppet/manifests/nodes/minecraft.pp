node 'kahlotus' {
  $my_cnf = 'minecraft_my.cnf' 
  $sshd_config = 'minecraft_sshd_config' 
  include base
  include minecraft
  
}
