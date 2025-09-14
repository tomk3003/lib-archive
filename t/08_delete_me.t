#!/usr/bin/env perl

use strict;
use warnings;

use FindBin qw($Bin);
use lib "$Bin/../lib";
use Test::More;

use_ok('List::MoreUtils');

done_testing();
