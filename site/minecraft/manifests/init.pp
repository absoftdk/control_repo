class minecraft {
  file { '/opt/minecraft':
    ensure => directory,
  }
  file {'/opt/minecraft/minecraft_server.jar':
    ensure => file,
    source => 'https://s3.amazonaws.com/Minecraft.Download/1.12.2/minecraft.1.12.2.jar',
  }
  package {'java':
    ensure => present,
  }
  file {'/opt/minecraft/eula.txt':
    ensure  => file,
    content => 'eula=true',
  }
  file { '/etc/systemd/system/minecraft.service', 
    ensure => file,
    source => 'puppet:///modules/minecraft.service',    
  }
}
