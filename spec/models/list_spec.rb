require 'spec_helper'

describe List do

  it "should be createable" do 
    list = List.new

    list.should be_valid
  end

  it "should accept things" do 
    pending "implement: addings things to lists"
  end

  it "should list its contents" do 
    pending "listing the contents of this list"
  end

  it "should belong to a user" do 
    pending "every list belongs to an owner"
  end
end
