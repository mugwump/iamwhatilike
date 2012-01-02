require 'spec_helper'

describe Thing do

  let(:auth) do 
    auth = {}
    auth["provider"] = "twitter"
    auth["uid"] = "bar"
    auth["info"]= {"name" => "baz"}
  end
  
  let(:user) do 
    auth = {}
    auth["provider"] = "twitter"
    auth["uid"] = "bar"
    auth["info"]= {"name" => "baz"}
    
    new_user = User.create_with_omniauth(auth)
  end
  

  it "should not be valid without a name and user to which the thing belongs" do
    thing = Thing.create
    thing.should_not be_valid
  end
  
  it "should be valid when given a name and a user" do
    
    
    thing = Thing.create(name: "Test", owner: user)

    thing.should be_valid
    thing.save

    thing.id.should_not be nil
  end
  
  it "should be added to the list of things of this user" do 
    thing = Thing.create(name: "Test", owner: user)
    
    user.things.should include thing
  end

  it "should be owned by a user" do
    list = List.create(owner: user, name: "Test")
    thing = Thing.create(name: "Test", owner: user)
    
    
    list.add_thing thing
    
    thing.owner.id.should == user.id
    
  end
end
