include wget
$slave2_packages = ['php','httpd']
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
  package { 'java-17-openjdk.x86_64' :
    ensure => present,
    }
  file { '/opt/minecraft/server.jar':
    ensure => 'file',
    source => 'https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  user { 'minecraft':
    ensure => 'present',
    system => true,
    shell  => '/bin/false',
    home   => '/opt/minecraft',
  }
  file { '/opt/minecraft':
    ensure => 'directory',
    owner  => 'minecraft',
    group  => 'minecraft',
    mode   => '0755',
  }
  file { '/opt/minecraft/server.properties':
    ensure => 'file',
    owner  => 'minecraft',
    group  => 'minecraft',
    mode   => '0644',
    content => "server-port=25565\n",
  }
  file { '/opt/minecraft/eula.txt':
    ensure  => present,
    content => "eula=true\n",
  }
  file { '/etc/systemd/system/minecraft.service':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    content => "[Unit]\nDescription=Minecraft Server\nAfter=network.target\n\n[Service]\nType=simple\nUser=minecraft\nWorkingDirectory=/opt/minecraft\nExecStart=/usr/bin/java -Xmx1024M -Xms1024M -jar server.jar nogui\nExecStop=/usr/bin/screen -p 0 -S minecraft -X eval 'stuff \"say Сервер Minecraft остановлен.\"\\015'\nExecStop=/bin/sleep 5\nExecStop=/usr/bin/screen -p 0 -S minecraft -X eval 'stuff \"stop\\015\"'\nRestartSec=3\nRestart=always\n\n[Install]\nWantedBy=multi-user.target\n",
  }
  exec { 'systemctl daemon-reload':
    command => '/bin/systemctl daemon-reload',
    path    => '/usr/bin:/usr/sbin/:/bin:/sbin',
    onlyif  => 'which systemctl',
  }service { 'minecraft':
    ensure    => 'running',
    enable    => true,
    hasstatus => true,
    pattern   => 'java.*server.jar',
  }
  }

 
