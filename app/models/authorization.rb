class Authorization
  include Mongoid::Document
  
  field :provider,    type: String, :allow_nil => false
  field :uid,         type: String, :allow_nil => false
  field :user_name,   type: String, :allow_nil => false

  belongs_to :user
end
