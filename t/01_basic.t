use strict;
use warnings;

use Test::More;

use version;

use lib::archive "arclib/VMod.tgz";

use VMod;
is(version->parse($VMod::VERSION), version->parse(1.0), 'version ok');

my $dfh = *{VMod::DATA};
ok(fileno($dfh), 'handle ok');
ok($dfh->can('seek'), 'can seek') if $] lt '5.020';
ok(seek($dfh, 0, 0), 'seek successful');

my $data = join '', <$dfh>;
$data =~ s/^.*\n__DATA__\r?\n/\n/s;

like($data, qr/^\s+TestData\s+$/, 'data ok');

done_testing();
