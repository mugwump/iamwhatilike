require 'spec_helper'

describe "Neography Integration" do


  let(:neo) do
    Neography::Rest.new("http://localhost:7474")
  end


  it "should be able to connect to a running server" do

    neo.should_not be nil

  end

  it "should be able to get a root" do
    root = neo.get_root
    root.should_not be nil

  end

  it "should be able to create a new node" do
    node1 = neo.create_node("myattribute" => "test", "name" => "testnode")

    node1.should_not be nil
  end


end
