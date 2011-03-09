package Params::Validate::Checks::Integer;
# ABSTRACT: Integer parameter validation
use strict;
use warnings;

use Params::Validate::Checks 0.01;

use Scalar::Util::Numeric    0.22 qw(isint);

Params::Validate::Checks::register( 
  'integer'     => sub {return isint($_[0])     } 
, 'non-neg-int' => sub {return isint($_[0]) == 1} );

1;
