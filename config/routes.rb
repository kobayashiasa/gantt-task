Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :columns, only: [:new, :create, :edit, :update, :destroy] do
    put :sort
    resources :tasks, except: :index do
      put :sort
    end
  end
end
