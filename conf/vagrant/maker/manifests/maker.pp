# command line tasks
exec {

	# install maker
	# do me as facter variable $maker
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
		command   => 'perl Build install',
		cwd       => '/usr/local/src/maker/src',       
		require   => Exec[ 'conf_maker' ];

    # add default EDITOR environment variable
    "make_editor_sh_ZOE":
	    command   => "echo 'export PATH=/usr/local/src/snap/Zoe:$PATH' >  /etc/profile.d/add_ZOE.sh",
	    cwd       => "/etc/profile.d",
	    creates   => "/etc/profile.d/add_ZOE.sh";	

    "make_editor_sh_PATH":
	    command => "echo 'export PATH=/usr/local/src/maker/bin:$PATH' >  /etc/profile.d/add_maker.sh",
	    cwd     => "/etc/profile.d",
	    creates => "/etc/profile.d/add_maker.sh";
}
