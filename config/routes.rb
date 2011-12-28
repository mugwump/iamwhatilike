Iamwhatilike::Application.routes.draw do

  root :to => 'main#index'
  
  match "tweet" => "main#tweet", :as => :tweet
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  match "/auth/failure" => "sessions#failure"

 
  # root :to => 'welcome#index'
end
