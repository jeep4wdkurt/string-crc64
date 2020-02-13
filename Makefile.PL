#! /usr/local/bin/perl

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile being created.
#homepage   => 'https://metacpan.org/module/String::CRC64',
#
WriteMakefile(
	'NAME' => 'String::CRC64',
	'DISTNAME' => 'String-CRC64',
	'OBJECT' => 'CRC64.o',
	'dist'   => {COMPRESS=>'gzip', SUFFIX=>'gz'},
    'LICENSE' => 'restricted',
	VERSION_FROM => 'CRC64.pm',
    META_MERGE => {
        resources => {
            license    => 'https://github.com/jeep4wdkurt/string-crc64/blob/master/LICENSE',
            homepage   => 'https://github.com/jeep4wdkurt/string-crc64',								
            bugtracker => 'https://github.com/jeep4wdkurt/string-crc64/issues',
            repository => 'https://github.com/jeep4wdkurt/string-crc64'
        },
    },
);
