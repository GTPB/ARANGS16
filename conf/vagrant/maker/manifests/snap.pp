exec {

    'dl_SNAP':
        command   => 'wget -O snap-2013-11-29.tar.gz http://korflab.ucdavis.edu/Software/snap-2013-11-29.tar.gz',
        cwd       => '/usr/local/src',
        creates   => '/usr/local/src/snap-2013-11-29.tar.gz',
        require   => Package[ 'wget' ];
    'untar_SNAP':
        command   => 'tar -zxvf snap-2013-11-29.tar.gz',
        cwd       => '/usr/local/src',
        creates   => '/usr/local/src/snap',
        require   => [ Exec[ 'dl_SNAP' ], Package[ 'tar' ] ];
    'make_SNAP':
        command   => 'make',
        cwd       => '/usr/local/src/snap',
        creates   => '/usr/local/src/snap/snap',
        require   => Exec[ 'untar_SNAP' ];
    'symlink_SNAP':
        command   => 'ln -s /usr/local/src/snap/snap /usr/local/bin/snap',
        creates   => '/usr/local/bin/snap',
        require   => Exec[ 'make_SNAP' ];
    'symlink_ZOE':
        command   => 'ln -s /usr/local/src/snap/ZOE /usr/local/bin/ZOE',
        creates   => '/usr/local/bin/ZOE',
        require   => Exec[ 'make_SNAP' ];

}
