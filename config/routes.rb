Rails.application.routes.draw do
  resources :portfolis, except: [:show]
  get 'portfolio', to: 'portfolis#index'
  get 'portfolio/:id', to: 'portfolis#show', as: 'portfoli_show'
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
