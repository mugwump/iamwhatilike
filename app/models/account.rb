class Account
  include Mongoid::Document

  belongs_to :user
  has_many :lists

  has_and_belongs_to_many :things


end
