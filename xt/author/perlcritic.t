#!/usr/bin/env perl

use warnings;
use strict;

use File::Spec;
use Test::Most;
use English qw(-no_match_vars);


eval { require Test::Perl::Critic; };

if ( $EVAL_ERROR ) {
  plan( skip_all
        => 'Test::Perl::Critic not found'  );
}

my $rcfile = File::Spec->catfile( 'xt', 'author', 'perlcriticrc' );
Test::Perl::Critic->import( -profile => $rcfile
                          , -exclude =>  [
                              'ProhibitStringyEval' 
                            , 'TestingAndDebugging::RequireUseStrict'
                            , 'TestingAndDebugging::RequireUseWarnings' ] );

all_critic_ok( 'lib' );
done_testing;
