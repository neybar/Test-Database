package Test::Database::Driver::MyDriver;
use strict;
use warnings;

use Test::Database::Driver;
our @ISA = qw( Test::Database::Driver );

# uncomment only if your database engine is file-based
#sub is_filebased {1}

sub _version {
    # return a version string
}

sub dsn {
    my ($self, $dbname) = @_;
    # retunr a dsn for $dbname
}

sub essentials {
    # OPTIONAL
    # return the list of essentials fields for string representation
}

# this routine has a default implementation for filed-based database engines
sub create_database {
    my ( $self, $dbname, $keep ) = @_;
    $dbname = $self->available_dbname() if !$dbname;

    # create the database if it doesn't exist
    # ...

    # return the handle
    return Test::Database::Handle->new(
        dsn      => $self->dsn($dbname),
        name     => $dbname,
        driver   => $self,
        # ... other fields, like username, password
    );
}

sub drop_database {
    my ( $self, $dbname ) = @_;

    # drop the database
}

# this routine has a default implementation for filed-based database engines
sub databases {
    my ($self) = @_;
    # return the names of all databases existing in this driver
}

# this routine has a default implementation for filed-based database engines
sub cleanup {
    my ($self) = @_;
    # remove all databases created using available_dbname()
}

'MyDriver';

__END__

=head1 NAME

Test::Database::Driver::MyDriver - A Test::Database driver for MyDriver

=head1 SYNOPSIS

    use Test::Database;
    my $dbh = Test::Database->dbh( 'MyDriver' );

=head1 DESCRIPTION

This module is the C<Test::Database> driver for C<DBD::MyDriver>.

=head1 SEE ALSO

L<Test::Database::Driver>

=head1 AUTHOR

Philippe Bruhat (BooK), C<< <book@cpan.org> >>

=head1 COPYRIGHT

Copyright 2008-2009 Philippe Bruhat (BooK), all rights reserved.

=head1 LICENSE

This module is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

