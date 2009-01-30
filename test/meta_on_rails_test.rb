require 'test/unit'
require 'rubygems'
require 'activesupport'
require File.dirname(__FILE__) + '/../lib/meta_on_rails'

class MetaOnRailsTest < Test::Unit::TestCase
  include MetaOnRails
  
  def test_should_have_default_values
    output = display_meta(:keywords => 'default')
    assert output.include?('<meta name="keywords" content="default"')
  end
  
  def test_should_strip_html
    set_meta(:keywords => '<bong>aword</bong>')
    output = display_meta
    assert !output.include?("<bong>")
    assert output.include?("aword")
  end
  
  def test_should_override_default_values
    set_meta(:keywords => 'override')
    output = display_meta(:keywords => 'default')
    assert output.include?('override')
  end

  def test_should_not_set_meta_when_displaying
    display_meta(:keywords => 'default')
    assert !display_meta(:something => 'else').include?('default')
  end

  def test_does_not_display_blank_values
    assert_equal display_meta(:keywords => '   '),''
  end

  def test_removes_double_quotes
    assert display_meta(:keywords => '""') =~ %r[content="''"/>]
  end
end