Rails.application.routes.draw do
  get 'businesses/new'
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  #post '/newexp',  to: 'experiences#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/user_feed',  to: 'static_pages#user_feed'
  
  #added 5 9 2018
  resources :businesses do 
    resources :experiences, except: [:index, :show]
    collection do 
      get 'search'
    end
  end
  
  resources :users do
    member do
      get :following, :followers, :followingz 
    end
  end
  
 # resources :businesses do
    
#  end
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  resources :businesses do
    
    member do
      get :followerzs
    
  end
    resources :experiences, except: [:index, :show]
   #collection do
   #end
  end
  
  # added resources experiences create destrory  4 25 2018
  resources :experiences,     only:   [:create, :destroy]
  resources :reviews,         only:   [:create, :destroy]
  resources :relationships,   only:   [:create, :destroy]
  resources :relationshipzs,  only:   [:create, :destroy]
  
  resources :businesses do
    collection { post :import }
  end
  
  
  
  
end