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
    enable => true,
  }
}
include wget
$slave2_packages = ['php','httpd']
node slave2 {
  packages { $slave2_packages :
    ensure => present,
    enable => true,
    }
  wget::fetch { "https://raw.githubusercontent.com/NupaZzz/Hometasks/master/01-vagrant/1/index.php" :
    destination => '/var/www/html',
    timeout  => 0,
    verbose  => false,
    }
  }

