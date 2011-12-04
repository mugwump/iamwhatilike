class User < ActiveRecord::Base

  after_create :assign_node

  def assign_node
    @usernode = Usernode.new(:user_id => self.id)
    @usernode.save
    
    update_attribute(:usernode_id,@usernode.id)

  end

  def node
    @usernode ||= Usernode.find_by_id(self.usernode_id)
  end

  def self.create_with_omniauth(auth)

    user = create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
    
  



  end
end
