user{"luxiaochen":
    name=>luxiaochen,
    home=>'/home/luxiaochen',
	managehome=>true,
    ensure=>present,
}

ssh_authorized_key { 'nick@magpie.example.com':
      ensure => present,
      user   => 'luxiaochen',
      type   => 'ssh-rsa',
      key    => 'AAAAB3NzaxxxxxqXfdaQ==',
}
