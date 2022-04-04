class minecraft (
  $url = 'https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar'
  $install_dir = '/opt/minecraft'
){
  file { $install_dir:
    ensure => directory,
  }
  file {"${install_dir}/minecraft_server.jar":
    ensure => file,
    source => $url,
  }
  package {'java':
    ensure => present,
  }
  file {"${install_dir}/eula.txt":
    ensure  => file,
    content => 'eula=true',
  }
  file { '/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft.service',    
  }
  service {'minecraft':
    ensure => running,
    enable => 'true',
  }
}
