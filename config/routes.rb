Rails.application.routes.draw do

  resources :news_articles, only: [:new, :create]
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'user/new'
  # get 'user/create'
  # the above routes were auto generated when running the user/session controller command

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  # get 'products/new', { to: 'products#new', as: :new_product }
  # post('/products', to: 'products#create')
  # get '/products/:id', {to: 'products#show', as: :product }
  # get('/product', to: 'products#index')
  # get('/products', to: 'products#index')
  # delete "/products/:id" => "products#destroy"
  # patch "/products/:id" => "products#update"
  # get "/products/:id/edit" => "products#edit"
  resources :products do
    resources :reviews, only: [:create, :destroy]
  end
  
  get '/', { to: 'home#index', as: :home }
  get '/about', { to: 'home#about' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/contact_us', { to: 'contacts#index', as: :contact }
  post '/contact_us', { to: 'contacts#create' }
  get '/admin/panel', { to: 'users#admin' }

end
