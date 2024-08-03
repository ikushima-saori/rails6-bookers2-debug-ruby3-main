Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users  #一番最後から移動
  root to: 'homes#top'  #root :to =>"homes#top"
  get "/home/about"=>"homes#about"  #get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  	get "follower_user" => "relationships#follower_user", as: "follower_user"
  	get "followed_user" => "relationships#followed_user", as: "followed_user"
  end

  get "/search", to: "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end  #追加