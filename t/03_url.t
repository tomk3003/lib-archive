use strict;
use warnings;

use Test::More;
use version;

our $cpan_ok = 0;
eval {
    require HTTP::Tiny;
    my $rp = HTTP::Tiny->new->get('https://www.cpan.org/modules/by-authors/id/');
    $cpan_ok = 1 if $rp->{success};
};

SKIP: {
    skip "cannot accesss CPAN" unless $cpan_ok;

    use_ok('lib::archive', qw(
        CPAN://PPI-Transform-Doxygen-0.32.tar.gz
        https://www.cpan.org/authors/id/T/TO/TOMK/Array-DeepUtils-0.2.tar.gz
    ));

    use_ok('PPI::Transform::Doxygen') ;
    is(
        version->parse($PPI::Transform::Doxygen::VERSION),
        version->parse(0.32),
        'PPI::Transform::Doxygen version'
    );

    use_ok('Array::DeepUtils');
    is(
        version->parse($Array::DeepUtils::VERSION),
        version->parse(0.2),
        'Array::DeepUtils version'
    );
}

done_testing();
