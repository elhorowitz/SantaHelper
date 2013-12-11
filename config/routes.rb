SantaHelper::Application.routes.draw do
  get "sign_up" => "members#new", :as => "sign_up"    

	get "welcome/index"
	resources :families do
		resources :members do
			resources :presents
		end
	end
  root to: 'families#index'
end
