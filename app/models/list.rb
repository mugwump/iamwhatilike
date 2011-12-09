class List
  include Mongoid::Document

  field :name, type: String, :allow_nil => false

end
