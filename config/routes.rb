Poolcket::Application.routes.draw do
  root 'home#index'
  get 'home/index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  get 'player/:id' => 'home#player', as: 'player'
  post 'player/:id/archive' => 'home#archive', as: 'archive'
  post 'player/:id/favorite' => 'home#favorite', as: 'favorite'
end
