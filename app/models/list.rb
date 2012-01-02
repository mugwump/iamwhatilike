# TODO: add some more functionality here...
class List
  include Mongoid::Document

  field :name, type: String, :allow_nil => false
  belongs_to :owner, class_name: "User"

  has_and_belongs_to_many :things

  validates_presence_of :owner

  def add_thing(thing)
    things << thing
  end

  def length
    things.length
  end
end
