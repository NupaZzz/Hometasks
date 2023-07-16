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

$slave2_packages = ['php','httpd']
node slave2 {
  packages { $slave2_packages :
    ensure => present,
    }
  file { 'index.php' :
    path => '/var/www/html/index.php
    content => '<html>
  <head>
    <title>Site is running PHP version <?= phpversion(); ?></title>
  </head>
  <body>
    <?php
      $limit = rand(1, 1000);
      for ($i=0; $i<$limit; $i++){
        echo "<p>Hello, world!</p>";
      }
    ?>
  </body>
</html>',
    require => Package['httpd','php']
    ensure => file,
    enable => true,
    }
  }

