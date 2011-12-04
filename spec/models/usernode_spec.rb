require 'spec_helper'

describe Usernode do

  it "should require a user-id" do

    node = Usernode.new
    node.should_not be_valid

    node.user_id = "4711"
    node.should be_valid

    node.save
    node.id.should_not be nil
  end
end
