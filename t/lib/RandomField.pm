package RandomField;

use Moose;
use SparkX::Form::Field::Plugin::StarML;

extends 'Spark::Form::Field';
with 'SparkX::Form::Field::Plugin::StarML';

has '+value' => (
    isa => 'Str',
);

sub render {
    my ($self,$html,@args) = @_;
    
    $html->input({type=>'text', name=>$self->name,value=>$self->value});
}


1;
__END__

