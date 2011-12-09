class Account
  include Mongoid::Document

  belongs_to :user
  has_many :lists

  has_and_belongs_to_many :things


  # todo associations with factory-girl/mongoid currently does not work without this hack
  def substitute(what)
  end

end
