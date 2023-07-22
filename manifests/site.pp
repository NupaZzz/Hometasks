include wget
$slave2_packages = ['php','httpd']
$mineserver = ['openjdk-8-jre-headless', 'screen']
node master {
  class { 'nginx': 
    manage_repo => true,
    package_source => 'nginx-mainline',
  }
  nginx::resource::server { '192.168.30.10:8080':
    listen_port => 8080,
    proxy       => 'http://192.168.30.11:80',
  }
  nginx::resource::server { '192.168.30.10:8081':
    listen_port => 8081,
    proxy       => 'http://192.168.30.12:80',
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
node mineserver {
 class { 'java' :
  package => 'java-1.8.0-openjdk-devel',
  }
  file { '/opt/minecraft':
    ensure => 'directory',
    owner  => 'minecraft',
    group  => 'minecraft',
    }
  wget::fetch { "https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar" :
    destination => '/opt/minecraft/server.jar',
    timeout => 0,
    verbose => false,
    }
  file { '/opt/minecraft/eula.txt':
    content => "eula=true",
    owner   => 'minecraft',
    group   => 'minecraft',
  }
  exec { 'start_minecraft_server':
    command => 'java -dmS minecraft java -Xmx1G -Xms1G -jar /opt/minecraft/server.jar nogui',
    user    => 'minecraft',
    cwd => '/opt/minecraft',
    path => '/usr/bin:/usr/sbin:/bin:/sbin'
  }
  service { 'minecraft_server':
    ensure  => 'running',
    require => [File['/opt/minecraft'], Exec['start_minecraft_server']],
  }
}

 
