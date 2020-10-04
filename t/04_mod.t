#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

use FindBin qw($Bin);
use lib "$Bin/../lib", "$Bin/lib";

use_ok('LoadRel');

done_testing();
