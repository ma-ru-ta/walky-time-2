Rails.application.routes.draw do
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
