node slave1 {
  package { 'httpd' :
    ensure => present,
  }
}
