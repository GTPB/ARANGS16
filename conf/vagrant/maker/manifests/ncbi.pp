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
	"bzip2":           ensure => installed, require => Exec ["apt_update"];
	"tar":             ensure => installed, require => Exec ["apt_update"];
	"git":             ensure => installed, require => Exec ["apt_update"];
	"build-essential": ensure => installed, require => Exec ["apt_update"];
	"gzip":            ensure => installed, require => Exec ["apt_update"];
	"zlib1g-dev":      ensure => installed, require => Exec ["apt_update"];
	"ncurses-dev":     ensure => installed, require => Exec ["apt_update"];
}

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




