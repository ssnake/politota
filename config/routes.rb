Rails.application.routes.draw do
  
  get 'comment/index'

  get 'main/index'
  post 'main/all_domain_posts'
  get 'main/all_domain_posts'
  get 'main/user/:user', to: 'main#user', as: 'main_user'
  root to: 'app#index'

  
  namespace :app do
    get :index
    resources :trolls do
    		post :fetch
    		post :cancel
    end
    namespace :comments  do
    	post :index
    end
    namespace :analyzer do
    	get '/:troll_id' =>'/app/analyzer#index'
    	post '/:troll_id' =>'/app/analyzer#index'
    end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
