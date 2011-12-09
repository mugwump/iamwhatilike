FactoryGirl.define do
  factory :user do
    sequence :uid do |n|
      "4711#{n}"
    end
    provider 'twitter'
    name  'test'
  end

  factory :account do
    user { |account| account.association(:user)}
  end

  factory :thing do
    name "A Thinng"
  end

  factory :toy, :parent => :thing do
    name "Humming top"
  end


end