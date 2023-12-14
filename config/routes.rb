Rails.application.routes.draw do

  devise_for :users,skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get 'home/about' => "homes#about", as: 'about'

    get "favorites" => "favorites#index"
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy] #１つの投稿に対してだから単数形
    end
    resources :users, only: [:show, :edit, :update, :check, :withdraw]
  end

  namespace :admin do
    root to: 'homes#top'

    resources :users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :update]
    resources :posts, only: [:show, :edit, :update, :destroy] do
      resources :comments, only: [:index, :show, :destroy]
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

