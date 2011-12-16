class User
  include Mongoid::Document

  after_create :assign_account

  field :provider, type: String, :allow_nil => false
  field :uid, type: String, :allow_nil => false
  field :name, type: String, :allow_nil => false
  
  # twitter fields
  field :token
  field :secret

  has_one :account
  
  def twitter
    unless @twitter_user
      @twitter_user = Twitter::Client.new(:oauth_token => token, :oauth_token_secret => secret) rescue nil
    end
    
    @twitter_user
  end

  def assign_account
    @account = Account.create(:user => self)
    @account.save
  end

  def self.create_with_omniauth(auth)

    user = create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      
      # token&secret to allow posting
      user.token  = auth['credentials']['token'] rescue nil
      user.secret = auth['credentials']['secret'] rescue nil
    end

  end
end
