include wget
$slave2_packages = ['php','httpd']
node master {
  class { 'nginx': 
    manage_repo => true,
    package_source => 'nginx-mainline',
  }
  nginx::resource::upstream { 'magick':
  members => {
    'localhost:8080' => {
      server => '192.168.30.11',
      port => 80,
    },
    '192.168.30.12:8081' => {
      server => '192.168.30.12',
      port => 80,
      },
   },
}
  nginx::resource::server { '192.168.30.10':
    proxy => 'http://magick',
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
