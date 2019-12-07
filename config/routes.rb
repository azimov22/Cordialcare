Rails.application.routes.draw do
  use_doorkeeper
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :members, skip: [:sessions, :registrations]
  devise_scope :member do
    get 'login', to: 'devise/sessions#new', as: :new_member_session
    post 'login', to: 'devise/sessions#create', as: :member_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_member_session
    get 'members/edit' => 'devise/registrations#edit', as: :edit_member_registration
    put 'members' => 'devise/registrations#update', as: :member_registration
  end

  scope module: 'erp' do
    root 'home#index'
    get '/sales/type' => 'sales#select_type'
    get '/sales/type/:sale_type_id/new' => 'sales#new', as: :sales_type_new
    get '/sales/type/:sale_type_id/sale/:id/edit' => 'sales#edit', as: :sales_type_edit
    resources :sales do
    end
    resources :members
    resources :profile
    resources :non_members
  end
end
