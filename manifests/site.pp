node slave1 {
  package { 'httpd' :
    ensure => present,
    }
  file { 'index.html' :
    path => '/var/www/html/index.html',
    content => '<h1>Hello there</h1>',
    require => Package['httpd'],
    ensure => file,
  }
}
