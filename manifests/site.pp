node slave1 {
    package { 'httpd:
        ensure => present,
    }
    service { 'httpd':
        ensure => running,
        enable => true,
        require => Package['apache2']
    }
}