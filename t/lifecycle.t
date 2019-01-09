#!perl6

use v6;

use Test;
use lib 't/lib';
use Smack::Test;

my @tests =
    -> $c, $u {
        my $response = $c.get($u);
        ok $response.is-success, 'request is ok';

        is $response.code, 200, 'response status is 200';
        is $response.content-type, 'text/plain', 'CT is text/plain';
        is $response.content, 'ok', 'response content is ok';
    },
    ;

my $test-server = Smack::Test.new(:app<lifecycle.p6w>, :@tests);
$test-server.run;

$test-server.treat-err-as-tap;

done-testing;
