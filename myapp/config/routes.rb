Rails.application.routes.draw do
	resources :shops do
		resources :products
	end
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	scope path: '/api', as: :api do
		scope :v1 do
			resources :products, controller: 'api/v1/products'
		end
	end	
end
