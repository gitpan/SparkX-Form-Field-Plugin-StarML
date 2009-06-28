#!perl -T

use Test::More tests => 4;

use Test::MockObject::Extends;
use SparkX::Form::Field::Plugin::StarML;
use lib 't/lib';
use RandomField;

my $form = Test::MockObject::Extends->new('Spark::Form');
my $field = RandomField->new(name=>'test', form=>$form);
is($field->to_xhtml,'<input name="test" type="text" />',"Test XHTML representation");
is($field->to_html,'<input name="test" type="text">',"Test HTML representation");
$field->value('foo');
is($field->to_xhtml,'<input name="test" type="text" value="foo" />',"Test XHTML representation");
is($field->to_html,'<input name="test" type="text" value="foo">',"Test HTML representation");
