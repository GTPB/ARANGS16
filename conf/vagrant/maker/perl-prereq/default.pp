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
	"wget":            ensure => installed, require => Exec["apt_update"]; # to fetch cpanm
	"bzip2":           ensure => installed, require => Exec["apt_update"]; # to unzip archives
	"tar":             ensure => installed, require => Exec["apt_update"]; # ,,
	"gzip":            ensure => installed, require => Exec["apt_update"]; # ,,
	"git":             ensure => installed, require => Exec["apt_update"]; # to fetch bioperl
	"build-essential": ensure => installed, require => Exec["apt_update"]; # to compile things
    "perl":            ensure => installed, require => Exec["apt_update"]; # probably already there
}

# command line tasks
exec {
	    # install perl dependency libraries, starting with the cpanm package
        # manager. According to the MAKER install instructions, BioPerl needs 
        # to come from github because the CPAN version is outdated. The other 
        # packages can come from CPAN.
	    "perl-cpanm":
		command => "wget -O - https://cpanmin.us | sudo perl - App::cpanminus",
		require => Package['wget'];

        "perl-bioperl-live":
		command => "cpanm --notest https://github.com/bioperl/bioperl-live.git@v1.6.x",
		require => Exec['perl-cpanm'];
        
        "perl-DBI":
		command => "cpanm --notest DBI",
		require => Exec['perl-cpanm'];

        "perl-DBD-SQLite":
		command => "cpanm --notest DBD::SQLite",
		require => Exec['perl-cpanm'];

        "perl-forks":
		command => "cpanm --notest forks",
		require => Exec['perl-cpanm'];

        "perl-forks-shared":
		command => "cpanm --notest forks::shared",
		require => Exec['perl-cpanm'];

        "perl-File-Which":
		command => "cpanm --notest File::Which",
		require => Exec['perl-cpanm'];

        "perl-Perl-Unsafe-Signals":
		command => "cpanm --notest Perl::Unsafe::Signals",
		require => Exec['perl-cpanm'];

        "perl-Bit-Vector":
		command => "cpanm --notest Bit::Vector",
		require => Exec['perl-cpanm'];

        "perl-Inline-C":
		command => "cpanm --notest Inline::C",
		require => Exec['perl-cpanm'];

        "perl-IO-All":
		command => "cpanm --notest IO::All",
		require => Exec['perl-cpanm'];

        "perl-IO-Prompt":
		command => "cpanm --notest IO::Prompt",
		require => Exec['perl-cpanm'];

}
