include wget
include nginx
$slave2_packages = ['php','httpd']
$master_pacakges = ['nginx']
node master {
  package { $master_pacakges :
    ensure => present,
  }
  nginx::resourse::server { "192.168.30.10" :
    listen_port => 8080,
    proxy => "http://192.168.30.11:80",
  }
  service { $master_pacakges :
    ensure => running,
    require => Package[$master_packages],
  }
}
node slave1 {
  package { 'httpd' :
    ensure => present,
    }
  wget::fetch { "https://raw.githubusercontent.com/NupaZzz/Hometasks/master/01-vagrant/1/index.html" :
    destination => '/var/www/html/index.html',
    timeout => 0,
    verbose => false,
    }
  service { 'httpd' :
    ensure  => running,
    require => Package['httpd'],
    }
  }
node slave2 {
  package { $slave2_packages :
    ensure => present,
    }
  wget::fetch { "https://raw.githubusercontent.com/NupaZzz/Hometasks/master/01-vagrant/1/index.php" :
    destination => '/var/www/html/index.php',
    timeout  => 0,
    verbose  => false,
    }
  service { 'httpd' :
    ensure  => running,
    require => Package['httpd'],
    }
  }
