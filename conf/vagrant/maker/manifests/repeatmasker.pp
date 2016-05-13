# command line tasks
exec {
    	# Download RepeatMasker
	'repM':
	command   => 'wget http://www.repeatmasker.org/RepeatMasker-open-4-0-6.tar.gz',
        cwd       => '/home/vagrant',
	require   => Package[ 'wget' ];	
	
	'unzip_repM':
	command   => 'tar zxvf RepeatMasker-open-4-0-6.tar.gz',
        cwd       => '/home/vagrant',
	require   => [ Exec[ 'repM' ], Package[ 'tar' ] ];

	# get trf
	'trf':
	command   => 'wget -O trf http://rvosa.github.io/arangs2016/downloads/arangs2016-trf.bin',
        cwd       => '/home/vagrant',
	require   => Package[ 'wget' ];	
	
	'trf_exe':
	command   => 'chmod a+x trf',
        cwd       => '/home/vagrant',
	require   => Exec[ 'trf' ];
	
	'trf_mv':
	command   => 'mv trf RepeatMasker',
        cwd       => '/home/vagrant',
	require   => Exec[ 'trf_exe' ];
	
	'mv_folder':
	command   => 'mv RepeatMasker /usr/local',
        cwd       => '/home/vagrant',
	require   => Exec[ 'trf_mv' ];

	# download  RMBlast
	'dl_rmblast':
	command   => 'wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/rmblast/2.2.28/ncbi-rmblastn-2.2.28-x64-linux.tar.gz',
        cwd       => '/home/vagrant',    
	require   => Package[ 'wget' ];
	
	'unzip_rmblast':
	command   => 'tar zxvf ncbi-rmblastn-2.2.28-x64-linux.tar.gz',
        cwd       => '/home/vagrant',
	require   => [ Exec[ 'dl_rmblast' ], Package[ 'tar' ] ];
	
	'mv_rmblast':
	command   => 'mv ncbi-rmblastn-2.2.28 /usr/local/rmblastn-2.2.28',
        cwd       => '/home/vagrant',
	require   => Exec[ 'unzip_rmblast' ];

	# download  Blast
	'dl_blast':
	command   => 'wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.28/ncbi-blast-2.2.28+-x64-linux.tar.gz', 
        cwd       => '/home/vagrant',   
	require   => Package[ 'wget' ];
	
	'unzip_blast':
	command   => 'tar zxvf ncbi-blast-2.2.28+-x64-linux.tar.gz',
        cwd       => '/home/vagrant',
	require   => [ Exec[ 'dl_blast' ], Package[ 'tar' ] ];
	
	'mv_blast':
	command   => 'cp -R ncbi-blast-2.2.28+/* /usr/local/rmblastn-2.2.28',
        cwd       => '/home/vagrant',
	require   => Exec[ 'unzip_blast' ];

	# create txt file 
	'do_file':
	command   => 'echo -e "\n/usr/bin/perl\n/usr/local/RepeatMasker\n/usr/local/RepeatMasker/trf\n2\n/usr/local/rmblastn-2.2.28\nY\n5\n" > answers.txt',    
        cwd       => '/usr/local/RepeatMasker',
	require   => Exec[ 'mv_folder' ];

    	# configure RepeatMasker
	'conf':
	command   => 'perl ./configure < answers.txt',
        cwd       => '/usr/local/RepeatMasker',
	require   => Exec[ 'mv_folder' ];

	'addPATH':
	command   => 'echo "export PATH=/usr/local/RepeatMasker:$PATH" >> .bashrc',
        cwd       => '/home/vagrant';

	# download Repbase repeat database
	'db':
	command   => 'wget http://rvosa.github.io/arangs2016/downloads/repeatmaskerlibraries-20150807.tar.gz',    
        cwd       => '/usr/local/RepeatMasker',
	require   => [ Exec[ 'mv_folder' ], Package[ 'wget' ] ];

	'unzip_db':
	command   => 'tar zxvf /usr/local/RepeatMasker/repeatmaskerlibraries-20150807.tar.gz',
        cwd       => '/usr/local/RepeatMasker',
	require   => [ Exec[ 'db' ], Package[ 'tar' ] ];

}

