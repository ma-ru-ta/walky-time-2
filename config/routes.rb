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
      resource :favorite, only: [:create, :destroy] #１つの投稿に対してだから
    end
    
    resources :users, only: [:show, :edit, :update] do
      collection do 
        patch :withdraw
        get :check
      end
      #↑ユーザー関連はcollectionを使うと良い！
      #   menberブロックを使用すると:idが取得される
      #     →既に自分の:idでユーザー編集（edit）に遷移するから余計な:idは付けない方が良い！
      #        働いたとき他のチーム開発したエンジニアに裏を読まれ混乱させてしまう可能性有り
    end
    
  end
  


  namespace :admin do

    resources :users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:index, :show, :destroy]
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

