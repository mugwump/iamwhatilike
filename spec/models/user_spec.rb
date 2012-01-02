require 'spec_helper'

describe User do

  let(:auth) do 

    auth = {}
    auth["provider"] = "twitter"
    auth["uid"] = "bar"
    auth["info"]= {"name" => "baz"}

    auth
  end



  it "should create a user from a given auth-hash" do
    
    auth.should_not be nil
    user = User.create_with_omniauth(auth)

    user.should_not be nil
    user.authorizations.should_not == nil
    user.authorizations.length.should == 1

  end

  it "should be found with a given uid and provider-id" do
    new_user = User.create_with_omniauth(auth)

    user = User.find_by_authorization(auth["provider"], auth["uid"])
    user.should_not be nil
  end

end
