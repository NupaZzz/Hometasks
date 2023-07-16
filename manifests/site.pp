node slave1 {
  package { 'httpd' :
    ensure => present,
    }
  file { 'index.html' :
    path => '/var/www/html/index.html',
    content => '<html>
  <head>
    <title>Success!</title>
  </head>
  <body>
    You Vagrantfile is fine if you can see this message.
  </body>
</html>',
    require => Package['httpd'],
    ensure => file,
  }
}
