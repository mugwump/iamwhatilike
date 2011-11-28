require 'spec_helper'

describe User do


  it "should create a user from a given auth-hash" do
    auth = {}
    auth["provider"] = "foo"
    auth["uid"] = "bar"
    auth["user_info"]= {"name" => "baz"}

    user = User.create_with_omniauth(auth)

    user.should_not be nil
    user.provider.should == "foo"
    user.uid.should == "bar"
    user.name.should == "baz"


  end


end
