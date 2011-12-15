class User
  include Mongoid::Document

  after_create :assign_account

  field :provider, type: String, :allow_nil => false
  field :uid, type: String, :allow_nil => false
  field :name, type: String, :allow_nil => false

  has_one :account


  def assign_account
    @account = Account.create(:user => self)
    @account.save
  end

  def self.create_with_omniauth(auth)

    user = create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end

  end
end
