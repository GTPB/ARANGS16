# command line tasks
exec {

	# install ncbi.blast
	'dl_ncbi.blast':
		command   => 'wget -O ncbi-blast-2.3.0.tar.gz ftp://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.3.0+-x64-linux.tar.gz',
		cwd       => '/usr/local/src',
		creates   => '/usr/local/src/ncbi-blast-2.3.0+-x64-linux.tar.gz',
		require   => Package[ 'wget' ];			
	'unzip_ncbi.blast':
		command   => 'gzip -d ncbi-blast-2.3.0.tar.gz',
		cwd       => '/usr/local/src',
		creates   => '/usr/local/src/ncbi-blast-2.3.0.tar',       
		require   => [ Exec[ 'dl_ncbi.blast' ], Package[ 'gzip' ] ];
	'untar_ncbi.blast':
		command   => 'tar xvf ncbi-blast-2.3.0.tar',
		cwd       => '/usr/local/src',
		creates   => '/usr/local/src/ncbi-blast-2.3.0',       
		require   => [ Exec[ 'unzip_ncbi.blast' ], Package[ 'tar' ] ];
	'symlink_ncbi.blast':
		command   => 'ln -s /usr/local/src/ncbi-blast-2.3.0/* /usr/local/bin/',
		creates   => '/usr/local/bin/blastdbcmd',       
		require   => Exec[ 'untar_ncbi.blast' ];
}




