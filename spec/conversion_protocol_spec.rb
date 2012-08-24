# require File.expand_path(File.dirname(__FILE__) + 'spec_helper')
require 'spec_helper'

describe 'Conversion protocol' do
  it "converts a string to a BigDecimal" do
    '42'.to_bd.should == BigDecimal('42')
  end

  it "converts a float to a BigDecimal" do
    1.23.to_bd.should == BigDecimal('1.23')
  end

  it "converts a BigDecimal to itself" do
    foo = BigDecimal('42')
    foo.to_bd.should be(foo)
  end
end
