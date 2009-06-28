package SparkX::Form::Field::Plugin::StarML;

our $VERSION = "0.1";

use Moose::Role;
use Spark::Form::Field;
use HTML::Tiny;

with 'Spark::Form::Field::Role::Printable::XHTML';
with 'Spark::Form::Field::Role::Printable::HTML';

requires 'render';

sub to_xhtml {
    shift->render(HTML::Tiny->new( mode => 'xml' ),@_);
}

sub to_html {
    shift->render(HTML::Tiny->new( mode => 'html' ),@_);
}

1;
__END__

=head1 NAME

SparkX::Form::Field::Plugin::StarML - Laziness for defining a field plugin that prints in html or xhtml depending on requirement.

=head1 SYNOPSIS

 package My::Field;

 use Moose;
 use 'SparkX::Form::Field::Plugin::StarML';
 extends 'Spark::Form::Field';
 with 'SparkX::Form::Field::Plugin::StarML';
 
 sub render {
     my ($self,$html,@args) = @_;
     print $html->input({type=>'text', name=>$self->name, value=>$self->value});
 }

=head1 FUNCTIONS

=head2 to_xhtml () => Str

Calls your render method with an XML-printing version of HTML::Tiny

=head2 to_html () => Str

Calls your render method with a HTML-printing version of HTML::Tiny

=head1 SEE ALSO

L<Spark::Form> - The forms module that started it all
L<Spark::Form::Manual> - The manual. Could be of assistance

=cut
