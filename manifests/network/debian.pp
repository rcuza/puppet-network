class network::debian {
  
  service { 'networking':
    ensure => running,
  }
  
  concat { '/etc/network/interfaces':
    mode    => 0644, 
    owner   => 'root', 
    group   => 'root',
    warn    => true,
    order   => numeric,
    notify  => Service['networking']
  }
  
  # loopback interface is always present
  concat::fragment { 'network_interface_loopback': 
    order  => 1,
    source => 'puppet:///modules/network/interfaces_loopback'
  }
  
}