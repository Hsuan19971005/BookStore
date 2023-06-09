Rails.application.routes.draw do
  root "pages#home"
  resources :books
  resource :users, except: [:new, :destroy] do
    get "sign_up", action: "new"
    get "sign_in"
  end
  resource :sessions, only: [:create, :destroy]

  resources :books do
    # member {post :like}
    resources :comments, shallow: true, only: [:create, :update, :edit, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :books, only: [] do
        member {post :like}
      end
    end
  end
end
