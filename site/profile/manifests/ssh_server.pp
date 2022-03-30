class profile::ssh_server {

  package {'openssh-server':
    ensure => present,
  }
  
  package { 'sshd': 
    ensure => 'running',
    ensure => 'true',  
  }
  
  ssh_authorized_key { 'root@master.puppet.vm':
   ensuer => present,
   user   => 'root',
   type   => 'ssh-rsa',
   key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCj/n2Jrbo3MaAGpASSChpLegodsnWeKrKmWK4gSU/uVmWzjgGsROPXwhJhrGcmv7YO6u+gZSVXRfoQeNej3OQkbG7rvwxB1hP2SOBYEN9AEOFIb1Zu4mRZHtdfODOtvl6/wFjXbUGkaQW+wg+fzVjon14rqp9bClekLl1VSciNgH7EAUsezXaBn9bPN+SiB7LsKk9XSlWNLJ85IgA4VNtewrRY5OhSn9yTzgUZpg5xH9N726VJCy4zxQkFwhVEj/gq3wZ/BvRf41yMoKriCBQd1a5JOMjp1C6X4b7nBKt+qlPiCDQvtR+qf/f1zMoO9TbnFER++z9dSyX+huCNu0P7',
  }
  
}
