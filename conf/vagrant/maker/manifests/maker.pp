# update the $PATH environment variable
Exec {
  path => [
		"/usr/local/sbin",
		"/usr/local/bin",
		"/usr/sbin",
		"/usr/bin",
		"/sbin",
		"/bin",
	]
}

# keep package information up to date
exec {
	"apt_update":
	command => "/usr/bin/apt-get update"
}

# install packages.
package {
	"wget":            ensure => installed, require => Exec ["apt_update"];
	"tar":             ensure => installed, require => Exec ["apt_update"];
    "export":          ensure => installed, require => Exec ["apt_update"];
    "perl":            ensure => installed, require => Exec ["apt_update"];
    "build-essential": ensure => installed, require => Exec ["apt_update"];
}

# command line tasks
exec {

	# install maker
	'dl_maker':
		command   => 'wget http://yandell.topaz.genetics.utah.edu/maker_downloads/D92C/8CA5/6529/E03F01572C356C5221A6AE0DDF9C/maker-2.31.8.tgz',
		cwd       => '/usr/local/src',
		creates   => '/usr/local/src/maker-2.31.8.tgz',
		require   => Package[ 'wget' ];			
	'unzip_maker':
		command   => 'tar zxvf maker-2.31.8.tgz',
		cwd       => '/usr/local/src',
		creates   => '/usr/local/src/maker',       
		require   => [ Exec[ 'dl_maker' ], Package[ 'tar' ] ];
	'conf_maker':
		command   => 'perl Build.PL',
		cwd       => '/usr/local/src/maker/src',
		require   => [Exec[ 'unzip_maker' ], Package[ 'perl' ] ];
	'install_maker':
		command   => './Build install',
		cwd       => '/usr/local/src/maker/src',       
		require   => Exec[ 'conf_maker' ];

    # add default EDITOR environment variable
    "make_editor_sh_ZOE":
	    command   => "sudo echo 'export PATH=/usr/local/src/snap/Zoe:$PATH' >  /etc/profile.d/add_ZOE.sh",
	    cwd       => "/etc/profile.d",
	    creates   => "/etc/profile.d/add_ZOE.sh";	

    "make_editor_sh_PATH":
	    command => "sudo echo 'export PATH=/usr/local/src/maker/bin:$PATH' >  /etc/profile.d/add_maker.sh",
	    cwd     => "/etc/profile.d",
	    creates => "/etc/profile.d/add_maker.sh";
}
