Rails.application.routes.draw do

	root "homes#home"
	get "/torainer", to: "homes#torainer"
	get "/torainee", to: "homes#torainee"
	get "/homes/about", to: "homes#about"
  	devise_for :admins
  	devise_for :users
  		resources :users, :only => [:show, :edit, :update] do
  			get :hide, on: :member
  			patch :hide_update, on: :member
  			resource :relationships, only: [:create, :destroy]
  				get :follows, on: :member
  				get :followers, on: :member
  		end

      resources :tweets do
        resources :tweet_comments, only: [:create, :destroy]
        resource :favorites, only: [:create, :destroy]
      end
      get "search" => "searchs#search"

      resources :users, only: [:show,:edit,:update]
      resources :messages, only: [:create]
      resources :rooms, only: [:create,:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
