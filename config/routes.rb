Rails.application.routes.draw do
  root to: 'prototypes#index'
  devise_for :users
  resources :users, only: [:edit, :show, :update]
  resources :prototypes do
    resources :comments, only: :create
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
