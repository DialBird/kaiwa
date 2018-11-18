# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
  end

  get 'aasm_hub' => 'aasm_hub#index'
  namespace :setup do
    get 'nick_name' => 'nick_name#edit'
    patch 'nick_name' => 'nick_name#update'
    get 'goal' => 'goal#edit'
    patch 'goal' => 'goal#update'
  end

  get 'dashboard' => 'dashboard#index'
  get 'settings' => 'settings#edit'
  patch 'settings' => 'settings#update'

  resource :user do
    resources :actions, except: :index
    resources :events
    resources :goals
    resources :habits, except: :index
  end

  authenticated :user do
    get '/' => redirect('/dashboard')
    root 'dashboard#index'
  end
  get 'dashboard' => 'dashboard#index'
  post 'dashboard' => 'dashboard#index'
  root 'home#index'
end
