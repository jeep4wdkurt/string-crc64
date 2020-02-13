#!/usr/local/bin/perl  -I./blib/arch -I./blib/lib

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==
# crc64-test.pl
#
# Unit test for String::CRC64 Perl Module
# by F. Kurt Schulte
# 
# Notes:
#
#	 Full Test
#			perl -w ./test/crc64-test.pl
#
# History
# ---------- ------- ----------- ---------------------------------------------------------------
# 2020.02.13 v1.0.0	KSchulte	Original Version
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==
#

use strict;
use 5.10.1;

use String::CRC64;

my $mungeLine 	= "Rob Sweet is teh awesome-o!";
my $digits		= "123456789";
my $testFile	= 'easter-bunny.txt';
my $testMotto 	= "Just becuase you have anatidaephobia doesn't mean ducks aren't watching you.";

my $sweetSucces	= 1;
my $testStatus	= 0;

my $crc 		= 0;


#
# Support routines
#
sub barf($) {
	my $outText = shift;
	print $outText . "\n";
}

sub passfail($;$) {
	my ($truth,$endflag) = @_;
	my $levelDesc = !defined($endflag) ? " Test" : "Suite";
	my $status	= sprintf("  %s Status   : %s",$levelDesc,$truth ? "PASS" : "### FAIL ###" );
	return $status;
}

#
# MAIN
#

barf( "####################################" );
barf( "Testing String::CRC64 Perl Module..." );

#
# Test 1 - String Variable
# 
barf( "\n1) CRC of a string variable" );
barf( sprintf("      Test String: %s",$mungeLine) );

$crc = String::CRC64::crc64($mungeLine);
barf( sprintf("   Returned Value: 0x%X (%d)",$crc,$crc) );
barf( passfail($testStatus = ($crc == 2215339331965387918)) );
$sweetSucces = 0	if ( ! $testStatus );

#
# Test 2 - Substrings, using crcinit parameter
#
barf( "\n2) CRC of a string cut into substrings, to test crcinit input param" );
barf( sprintf("      Test String: (%s,%s)",substr($digits,0,5),substr($digits,5,4)) );

$crc	= 0;
$crc	= String::CRC64::crc64(substr($digits,0,5),$crc);
barf( sprintf("Intermeiary Value: 0x%X (%u)",$crc,$crc) );
$crc	= String::CRC64::crc64(substr($digits,5,4),$crc);

barf( sprintf("   Returned Value: 0x%X (%u)",$crc,$crc) );
barf( passfail($testStatus=($crc == 16845390139448941002)) );
$sweetSucces = 0	if ( ! $testStatus );

#
# Test 3 - File input, something larger than crc64fp's read buffer
#

barf( "\n3) CRC of a file, larger than 32k read buffer" );
barf( sprintf("       Input File: %s",$testFile ) );

open(TESTFILE,$testFile) || 
	open(TESTFILE,"test/" . $testFile) ||
	open(TESTFILE," ../" . $testFile) || die "No such file! Can't file input file (" . $testFile . ")\n";
$crc = String::CRC64::crc64(*TESTFILE);
close TESTFILE;

barf( sprintf("   Returned Value: 0x%X (%u)",$crc,$crc) );
barf( passfail($testStatus=($crc == 10290303189223606326)) );
$sweetSucces = 0	if ( ! $testStatus );

#
# Epilogue
#
barf( "\nString::CRC64 Tests complete." );
barf( passfail($sweetSucces,1) );




