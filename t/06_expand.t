#!/usr/bin/env perl

use strict;
use warnings;

use FindBin qw($Bin);
use lib "$Bin/../lib";

use Test::More;
use version;
use File::Path qw(remove_tree);

my $exp_dir;

BEGIN {
    $ENV{PERL_LIB_ARCHIVE_EXTRACT} = $exp_dir = "$Bin/expand";
    remove_tree($exp_dir);
}

use lib::archive "arclib/*.tgz";

use_ok('VMod');
is( version->parse($VMod::VERSION), version->parse(1.0), 'version ok' );
like( $INC{'VMod.pm'}, qr($exp_dir/VMod.pm), 'expanded lib' );
ok( -e "$exp_dir/VMod.pm", 'module file exists' );

remove_tree($exp_dir);

done_testing();
