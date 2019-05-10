Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products
      resource :session, only: [:create, :destroy]
    end
  end
  
  get 'votes/create'
  get 'votes/destroy'
  get 'votes/update'
  get 'favourites/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  
  # namespace :admin do
  #   resources :dashboard, only: [:index]
  # end
  
  # Notice that `resource` is singular. Unlike `resources`,
  # `resource` will create routes that are meant to do CRUD
  # on a single thing. There will be no index route or any
  # route with :id. When using singular resource, the controller
  # it links to should still be plural.
  get '/admin/panel', { to: 'users#admin' }

  resource :session, only: [:new, :create, :destroy]

  resources :products do
    # creates the following route for us:
    # post('/products/:product_id/reviews', { to: 'reviews#create', as: :product_reviews })
    # Which, due to the `as` creates a method called `product_reviews_path`
    # This method requires one variable, a product or product id to "fill in"
    # the value for `:product_id` in the path
    # It returns the value: '/products/:product_id/reviews' with the :product_id
    # "filled in"
    resources :reviews, shallow: true, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
      resources :votes, only: [:create, :destroy, :update]
    end
    resources :favourites, shallow: true, only: [:create, :destroy]
  end

  resources :favourites, only: [:index]

  patch "/reviews/:id/toggle" => "reviews#toggle_hidden", as: "toggle_hidden"

  resources :news_articles
  
  get '/', { to: 'home#index', as: :root }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get('/about', { to: 'home#about', as: :about })
  get('/contact_us', { to: 'contacts#index', as: :contact })
  post('/contact_us', { to: 'contacts#create' })
end


