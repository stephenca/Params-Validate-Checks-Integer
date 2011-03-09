package Params::Validate::Checks::Integer;
# ABSTRACT: Integer parameter validation
use strict;
use warnings;

use Params::Validate::Checks 0.01;

use Scalar::Util::Numeric    0.22 qw(isint);

=pod

=head1 NAME

Params::Validate::Checks::Integer - Params::Validate checks for functions
taking integer arguments.

=head1 SYNOPSIS

  use Params::Validate::Checks qw<validate as>;
  use Params::Validate::Checks::Integer;

  sub league_table_row
  {
    my %arg = validate @_,
    {
      position     => { as 'pos_int' }, #From P::V::Checks
      games_played => { as 'non-neg-int' },
      points       => { as 'integer' }, #Allow for points deducted!
      goal_difference
                   => { as 'integer' },
    };

    # Do something with this league table position.
  }

=head1 DESCRIPTION

This is a library of named checks for use with L<Params::Validate> to validate
all integers and those that should be non-negative.   See L<Params::Validate::Checks>
for in-built validation of positive (non-zero) integers.

=head2 Checks

The following named checks are supplied by this module.

=over

=item C<integer>

an integer value, which can be positive, negative or zero.

=item C<non-neg-int>

an integer value, which can be positive or zero.

=back

=cut


Params::Validate::Checks::register( 
  'integer'     => sub {return isint($_[0])     } 
, 'non-neg-int' => sub {return isint($_[0]) == 1} );

=head1 SEE ALSO

=over 2

=item *

L<Params::Validate::Checks>, the framework this is using

=item *

L<Scalar::Util::Numeric>, provider of the isint() check.

=back

=head1 CREDITS

Smylers <smylers@cpan.org> for Params::Validate::Checks.

chocolateboy <chocolate@cpan.org> for Scalar::Util::Numeric

=cut

1;

