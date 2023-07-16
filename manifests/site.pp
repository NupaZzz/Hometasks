node master {
       package { 'httpd':
              ensure => present,
       }
}
