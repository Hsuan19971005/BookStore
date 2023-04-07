Rails.application.routes.draw do
  root "pages#home"
  resources :books
  resource :users, except: [:new, :destroy] do
    get "sign_up", action: "new"
    get "sign_in"
  end
  resource :sessions, only: [:create, :destroy]
end
