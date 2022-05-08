Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :columns, only: [:new, :create, :edit, :update, :destroy] do
    resources :tasks, except: :index
  end
end
