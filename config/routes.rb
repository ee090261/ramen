Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get 'top' => 'searches#top'
  get 'about' => 'users#about'

  resources :users, :only => [:show, :edit, :update, :destroy, :index]
  resources :posts, :only => [:new, :create, :show, :destroy, :edit, :update] do
  	resources :post_comments, :only => [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end

end
