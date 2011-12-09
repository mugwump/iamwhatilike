require 'spec_helper'

describe User do

  let(:auth) do 

    auth = {}
    auth["provider"] = "foo"
    auth["uid"] = "bar"
    auth["info"]= {"name" => "baz"}

    auth
  end



  it "should create a user from a given auth-hash" do
    
    auth.should_not be nil
    user = User.create_with_omniauth(auth)

    user.should_not be nil
    user.provider.should == "foo"
    user.uid.should == "bar"
    user.name.should == "baz"


  end


  it "should be assigned a user-node in neo4j" do 
     user = User.create_with_omniauth(auth)

     user.account.should_not == nil


  end

  it "should have an account, when read from the database" do
    user = User.create_with_omniauth(auth)
    id = user.id

    retrieved_user = User.find(id)

    
    retrieved_user.account.id.should_not == nil



  end

end
