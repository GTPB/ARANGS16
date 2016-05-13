# command line tasks
exec {

	# install exonerate
	'dl_exonerate':
		command   => 'wget -O exonerate-2.2.0-x86_64.tar.gz http://ftp.ebi.ac.uk/pub/software/vertebrategenomics/exonerate/exonerate-2.2.0-x86_64.tar.gz',
		cwd       => '/usr/local/src',
		creates   => '/usr/local/src/exonerate-2.2.0-x86_64.tar.gz',
		require   => Package[ 'wget' ];			
	'unzip_exonerate':
		command   => 'gzip -d exonerate-2.2.0-x86_64.tar.gz',
		cwd       => '/usr/local/src',
		creates   => '/usr/local/src/exonerate-2.2.0-x86_64.tar',       
		require   => [ Exec[ 'dl_exonerate' ], Package[ 'gzip' ] ];
	'untar_exonerate':
		command   => 'tar xvf exonerate-2.2.0-x86_64.tar',
		cwd       => '/usr/local/src',
		creates   => '/usr/local/src/exonerate-2.2.0-x86_64',       
		require   => [ Exec[ 'unzip_exonerate' ], Package[ 'tar' ] ];
	'symlink_exonerate':
		command   => 'ln -s /usr/local/src/exonerate-2.2.0-x86_64/bin/* /usr/local/bin/',
		creates   => '/usr/local/bin/exonerate',       
		require   => Exec[ 'untar_exonerate' ];
}




