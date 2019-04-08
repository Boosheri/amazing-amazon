Rails.application.routes.draw do
  get '/', { to: 'home#index', as: 'home' }

  get '/about', { to: 'home#about' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/contact_us', { to: 'contacts#index', as: :contact }
  post '/contact_us', { to: 'contacts#create' }
end
