require 'test/unit'
require File.dirname(__FILE__) + '/../lib/meta_on_rails'

class MetaOnRailsTest < Test::Unit::TestCase
  include MetaOnRails
  
  def test_should_have_default_values
    output = display_meta(:keywords => 'default')
    assert output.include?("<meta name=\"keywords\" content=\"default\"")
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
end
