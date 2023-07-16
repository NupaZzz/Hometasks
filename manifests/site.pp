package { 'apache2' :
  ensure => present,
  }
file { 'index.html' :
  path => '/var/www/html/index.html',
  content => '<h1>Hello there</h1>',
  require => Package['apache2'],
  ensure => file,
  }
