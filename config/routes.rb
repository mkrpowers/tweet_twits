Rails.application.routes.draw do
  
  root 'twitcenter#feed'
  get 'show_user' => 'twitcenter#show_user'
  get 'now_following' => 'twitcenter#now_following'
  get 'unfollow' => 'twitcenter#unfollow'
  get 'tag_tweets' => 'twitcenter#tag_tweets'
  get 'all_users' => 'twitcenter#all_users'
  get 'following' => 'twitcenter#following'
  get 'followers' => 'twitcenter#followers'
  
  resources :tweets
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
