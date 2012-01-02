class Thing
  include Mongoid::Document

  field :name, type: String
  has_and_belongs_to_many :lists

  belongs_to :owner, :class_name => "User", inverse_of: :things


  validates_presence_of :name



end
