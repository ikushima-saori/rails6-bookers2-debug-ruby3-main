Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users  #一番最後から移動
  root to: 'homes#top'  #root :to =>"homes#top"
  get "/home/about"=>"homes#about"  #get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end  #追加