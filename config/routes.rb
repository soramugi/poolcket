Poolcket::Application.routes.draw do
  root 'home#index'
  get 'home/index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  get 'player/:id' => 'player#show', as: 'player'
  post 'player/:id/archive' => 'player#archive', as: 'archive'
  post 'player/:id/favorite' => 'player#favorite', as: 'favorite'
end
