Rails.application.routes.draw do
  namespace :public do
    get 'comments/new'
    get 'comments/create'
    get 'comments/destroy'
  end
  namespace :public do
    get 'posts/new'
    get 'posts/create'
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
    get 'posts/update'
    get 'posts/destroy'
  end
  namespace :public do
    get 'favorites/index'
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/check'
    get 'users/withdraw'
  end
  namespace :public do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
  namespace :public do
    get 'registrations/new'
    get 'registrations/create'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'comments/index'
    get 'comments/show'
    get 'comments/destroy'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'posts/show'
    get 'posts/edit'
    get 'posts/update'
    get 'posts/destroy'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'sessions/new'
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
