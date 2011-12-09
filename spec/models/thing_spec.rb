require 'spec_helper'

describe Thing do

  it "should have a name and an optional description" do
    thing = Thing.create

    thing.should_not be_valid

    thing.name ="Test"

    thing.should be_valid
    thing.save

    thing.id.should_not be nil
  end

  it "should be owned by a user" do
    pending "every thing should belong to a user (can users share things?!)"
  end
end
