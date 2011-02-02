require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "MetaOnRails" do
  include MetaOnRails::ViewHelpers

  it "should have default values" do
    output = display_meta(:keywords => 'default')
    output.should include('<meta name="keywords" content="default"')
  end

  describe "strip html" do
    before do
      set_meta(:keywords => '<bong>aword</bong>')
    end
    let(:output) { display_meta }

    it "should strip tag" do
      output.should_not include("<bong>")
    end

    it "should contain text" do
      output.should include("aword")
    end
  end

  it "should override default values" do
    set_meta(:keywords => 'override')
    output = display_meta(:keywords => 'default')
    output.should include('override')
  end

  it "should not set meta when displaying" do
    display_meta(:keywords => 'default')
    display_meta(:something => 'else').should_not include('default')
  end

  it "does not display blank values" do
    display_meta(:keywords => '   ').should == ''
  end

  it "removes double quotes" do
    (display_meta(:keywords => '""') =~ %r[content="''"/>]).should > 0
  end
end
