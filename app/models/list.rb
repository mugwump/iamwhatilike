# TODO: add some more functionality here...
class List
  include Mongoid::Document

  field :name, type: String, :allow_nil => false
  belongs_to :account

  has_and_belongs_to_many :things

  validates_presence_of :account

  def add_thing(thing)
    things << thing
    account.things << thing
  end

  def length
    things.length
  end
end
