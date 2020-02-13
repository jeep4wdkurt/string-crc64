package String::CRC64;

use strict;
use warnings;

require Exporter;
require DynaLoader;

use vars qw/ @ISA $VERSION @EXPORT_OK @EXPORT /;

@ISA = qw(Exporter DynaLoader);

$VERSION = 1.000;

# Items to export into caller's namespace by default
@EXPORT = qw(crc64);

# Other items we are prepared to export if requested
@EXPORT_OK = qw();

bootstrap String::CRC64;

1;
