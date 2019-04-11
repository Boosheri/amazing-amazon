Rails.application.routes.draw do
  get 'products/new', { to: 'products#new', as: :new_product }
  post('/products', to: 'products#create')
  get '/products/:id', {to: 'products#show', as: :product }
  get('/product', to: 'products#index')
  get('/products', to: 'products#index')
  delete "/products/:id" => "products#destroy"
  patch "/products/:id" => "products#update"
  get "/products/:id/edit" => "products#edit"

  get '/', { to: 'home#index', as: :home }


  get '/about', { to: 'home#about' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/contact_us', { to: 'contacts#index', as: :contact }
  post '/contact_us', { to: 'contacts#create' }

  
end
