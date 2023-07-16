node default {
       mod 'puppetlabs-apache', '10.1.1'
}

node slave1 {
       package { 'httpd':
        ensure => present,
    }
    service { 'httpd':
        ensure => running,
        enable => true,
        require => Package['httpd']
    }
}
