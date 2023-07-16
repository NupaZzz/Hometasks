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
include wget
$slave2_packages = ['php','httpd']
node slave2 {
  package { $slave2_packages :
    ensure => present,
    }
  wget::fetch { "https://raw.githubusercontent.com/NupaZzz/Hometasks/master/01-vagrant/1/index.php" :
    destination => '/var/www/html/index.php',
    timeout  => 0,
    verbose  => false,
    }
  }

