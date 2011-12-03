class Thing < Architect4r::Model::Node 

  property :name, :cast_to => String 
  timestamps!

  # Validations 
  validates :name, :presence => true



end
