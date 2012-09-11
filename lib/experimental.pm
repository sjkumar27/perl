package experimental;

$VERSION = '0.01';

sub __common {
    my $meth = shift;
    if (!@_) {
	require Carp;
	Carp::croak ("No experimental features specified")
    }
    require feature;
    feature->$meth(map "experimental::$_", @_);
}    

sub import {
    splice @_, 0, 1, 'import';
    goto &__common;
}

sub unimport {
    splice @_, 0, 1, 'unimport';
    goto &__common;
}

my(undef) = (undef);  # return a true value

__END__

=head1 NAME

experimental - Enable experimental features

=head1 SYNOPSIS

    use experimental 'lexical_subs';
    # lexical_subs feature enabled here

    {
        no experimental 'lexical_subs';
        # temporarily disabled
    }

=head1 DESCRIPTION

This pragma enables or disables experimental features in Perl.  These are
features that may be modified or removed in future Perl versions.  Some new
features are put here to be tested first before being upgraded to
"accepted" status.  Feel free to use these features in your own personal
experiments, but beware of using them in production code!

This:

    use experimental 'foo';

is actually equivalent to:

    use feature 'experimental::foo';

=head1 THE FEATURES

=over

=item * lexical_subs

This enables declaration of subroutines via C<my sub foo>, C<state sub foo>
and C<our sub foo> syntax.  See perlsub/xxxx for details.

=back

=head1 SEE ALSO

L<feature>, L<perlexperiment>
