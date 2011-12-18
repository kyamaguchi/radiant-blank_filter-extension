require File.dirname(__FILE__) + '/../spec_helper'

module ErroredRender
  def self.included(base)
    base.class_eval do
      alias_method_chain :render, :error
    end
  end

  def render_with_error
    "woo hoo"
    end
end

require File.expand_path("../../spec_helper", __FILE__)

describe BlankFilter do
  it "should be named Blank" do
    BlankFilter.filter_name.should == "Blank"
  end

  it "should remove blank lines and add extra line feed" do
    BlankFilter.filter("test1\r\n\r\n\r\ntest2").should == "test1\r\ntest2\r\n"
  end

  it "should remove blank lines at the end of text" do
    BlankFilter.filter("test1\r\ntest2\r\n\r\n").should == "test1\r\ntest2\r\n"
  end

  it "should remove leading blank lines" do
    BlankFilter.filter("\r\n\r\ntest1\r\ntest2\r\n").should == "test1\r\ntest2\r\n"
  end

  it "should remove trailing spaces" do
    BlankFilter.filter("test1   \r\ntest2\r\n").should == "test1\r\ntest2\r\n"
  end

  it "should remove trailing tabs" do
    BlankFilter.filter("test1\t\t\r\ntest2\r\n").should == "test1\r\ntest2\r\n"
  end

  it "should remove trailing spaces and tabs" do
    BlankFilter.filter("test1	 \t \r\ntest2\r\n").should == "test1\r\ntest2\r\n"
  end
end

describe "<r:blank>" do
  dataset :pages
  it "should remove blank lines" do
    pages(:home).should render("<r:blank>\r\n\r\ntest1\r\n\r\ntest2\r\n\r\n</r:blank>").as("test1\r\ntest2\r\n")
  end

  it "should remove trailing spaces" do
    pages(:home).should render("<r:blank>test1   \r\ntest2\r\n</r:blank>").as("test1\r\ntest2\r\n")
  end
end
