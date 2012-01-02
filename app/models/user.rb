class User
  include Mongoid::Document

  after_create :assign_account


  has_one   :account
  has_many  :authorizations
  
  def self.find_by_authorization(provider, user_id)
    authorization = Authorization.where(provider: provider, uid: user_id).first
    authorization.user
  end
  
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
      if auth["provider"] == "twitter"
        authorization = TwitterAuthorization.new
        authorization.provider = auth["provider"]
        authorization.uid = auth["uid"]
          authorization.user_name = auth["info"]["name"]
      
        # token&secret to allow posting
        authorization.token  = auth['credentials']['token'] rescue nil
        authorization.secret = auth['credentials']['secret'] rescue nil
        user.authorizations << authorization
        authorization.save!
      end
      
    end

  end
end
