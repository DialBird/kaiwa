# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
  end

  get 'dashboard' => 'dashboard#index'
  get 'settings' => 'settings#edit'
  patch 'settings' => 'settings#update'

  authenticated :user do
    root 'dashboard#index'
  end
  root 'home#index'
end
