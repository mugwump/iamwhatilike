require 'spec_helper'

describe List do

  let(:user) do 
    auth = {}
    auth["provider"] = "twitter"
    auth["uid"] = "bar"
    auth["info"]= {"name" => "baz"}
    
    new_user = User.create_with_omniauth(auth)
  end

  it "should be valid with an account and a name" do

    list = List.create(owner: user, name: "Test")
    list.should be_valid
  end

  it "should not be valid without a user" do
    list = List.create(name: "test")

    list.should_not be_valid

  end

  it "should accept things" do 
    list = List.create(owner: user, name: "Test")

    thing = Thing.create(name: "A Thing")

    list.add_thing thing

    list.length.should be 1
  end

  it "should add the thing to the list of things of the owner of the list" do

    list = List.create(owner: user, name: "Test")
    toy = Factory(:toy)

    list.add_thing toy

    list.things.should include toy

  end

  it "should list its contents" do 
    pending "listing the contents of this list"
  end


end
