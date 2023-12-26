Rails.application.routes.draw do

  devise_for :users,skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

# 　会員側
  scope module: :public do
    root to: "homes#top"
    get 'home/about' => "homes#about", as: 'about'
    get "favorites" => "favorites#index"

    get "/search", to: "searches#search"

    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy, :index] #１つの投稿に対してだから
    end
    post "posts/:id/switch_on" => "posts#switch_on", as: 'switch_on'       #募集「済」
    post "posts/:id/switch_off" => "posts#switch_off", as: 'switch_off'    #募集中に戻す

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

    # ゲストユーザーログイン
    devise_scope :user do
      post 'users/guest_sign_in', to: 'sessions#guest_sign_in'
    end
  end


  # 管理者側
  namespace :admin do

    get "/search", to: "searches#search"
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:show, :destroy]
    end
    resources :comments, only: [:index]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

