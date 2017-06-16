Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolis, except: [:show] do
    put :sort, on: :collection
  end
  
  # get 'portfolio', to: 'portfolis#index'
  get 'portfolis/:id', to: 'portfolis#show', as: 'portfoli_show'
  get 'anuglar-items', to: 'portfolis#angular'

  get 'about-me', to: 'pages#about'	# get 'pages/about'
  get 'contact', to: 'pages#contact'	# get 'pages/contact'

  resources :blogs do
  	member do
  		get :toggle_status   # toggle_status_blog_path(blog)
  	end												#                       id
  end


  root to: 'pages#home'  # can call anything , # get 'pages/home'
end
