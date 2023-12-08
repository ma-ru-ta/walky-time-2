Rails.application.routes.draw do

  devise_for :users,skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get 'home/about' => "homes#about", as: 'about'

    resources :comments, only: [:new, :create, :destroy]
    resources :posts, only: [:new, :create, :index, :show, :update, :destroy]
    resources :favorites, only: [:index, :create, :destroy]
    resources :users, only: [:show, :edit, :update, :check, :withdraw]
    resources :sessions, only: [:new, :create, :destroy]
    resources :registrations, only: [:new, :create]
  end

  namespace :admin do
    root to: 'homes#top'

    resources :comments, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :update]
    resources :posts, only: [:show, :edit, :update, :destroy]
    resources :sessions, only: [:new, :create, :destroy]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
