# command line tasks
exec {
	    # set locale to US english to get rid of annoying perl warnings
	    "set_locale_sh":
	    command => "echo 'export LC_ALL=en_US.UTF-8' > set_locale.sh",
	    cwd     => "/etc/profile.d",
	    creates => "/etc/profile.d/set_locale.sh";

	    # install perl dependency libraries, starting with the cpanm package
        # manager. According to the MAKER install instructions, BioPerl needs 
        # to come from github because the CPAN version is outdated. The other 
        # packages can come from CPAN.
	    "perl-cpanm":
		command => "wget -O - https://cpanmin.us | sudo perl - App::cpanminus",
		require => Package['wget'];

        "perl-bioperl-live":
		command => "cpanm --notest --force https://github.com/bioperl/bioperl-live.git@v1.6.x",
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
