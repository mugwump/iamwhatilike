class Usernode < Architect4r::Model::Node 

  property :user_id, :cast_to => String
  timestamps!

  # Validations 
  validates :user_id, :presence => true
end
