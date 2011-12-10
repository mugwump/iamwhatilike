require 'spec_helper'

describe List do

  let(:user) { Factory(:user)}

  it "should be valid with an account and a name" do

    account = user.account
    list = List.create(account: account, name: "Test")


    list.should be_valid
  end

  it "should not be valid without a user" do
    list = List.create(name: "test")

    list.should_not be_valid

  end

  it "should accept things" do 
    account = user.account
    list = List.create(account: account, name: "Test")

    thing = Thing.create(name: "A Thing")

    list.add_thing thing

    list.length.should be 1
  end

  it "should add the thing to the list of things of the owner of the list" do

    account = user.account

    list = List.create(account: account, name: "Test")
    toy = Factory(:toy)

    list.add_thing toy

    account.things.should include toy

  end

  it "should list its contents" do 
    pending "listing the contents of this list"
  end


end
