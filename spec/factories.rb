FactoryGirl.define do
  # TODO: make a proper user-factory with a valid account
  factory :user do
    provider 'twitter'
    name  'test'
    
  end
  
  factory :twitter_authorization do 
    provider 'twitter'
    sequence :uid do |n|
      "4711#{n}"
    end
    user_name 'test'
    
  end
  factory :thing do
    name "A Thing"
  end

  factory :toy, :parent => :thing do
    name "Humming top"
  end


end