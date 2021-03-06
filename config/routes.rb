Rails.application.routes.draw do
  root :to => 'welcome#index'
  match('/recipes/get_random_recipe', {:via => :get, :from => 'recipes#get_random_recipe'})
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  match('/recipes/search', {:via => :get, :to => 'recipes#search_by_ingredients'})
  match('/recipes/:id/add_rating', {:via => :post, :to => 'recipes#add_rating'})
  match('/users/login', {:via => :get, :from => 'devise/sessions#new'})

  resources :ratings
  match('/recipes/:id/add_tag', {:via => :post, :to => 'recipes#add_tag'})
  # match('/tags/:id', {:via => :get, :to => 'tags#find_recipe'})
  match('/tags/search', {:via => :get, :to => 'tags#search'})

  resources :tags
  resources :recipes


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
