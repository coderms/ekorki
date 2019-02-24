Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Application controller
  get 'index' => 'application#index'
  get 'login' => 'application#login'
  post 'login' => 'application#new_session'
  get 'logout' => 'application#logout'
  get 'contact' => 'application#contact'
  post 'search' => 'application#search'
  get 'search' => 'application#index'
  get 'user_message' => 'application#index'
  
  # Ad controller (Advertisements)
  get 'add' => 'ad#add'
  post 'add' => 'ad#create'
  get 'remove/:id' => 'ad#delete'
  get 'edit/:id' => 'ad#edit'
  post 'edit/:id' => 'ad#update'
  get 'view/:id' => 'ad#view'
  post 'user_message' => 'ad#user_message'
  
  # Register controller
  get 'register' => 'register#form'
  post 'register' => 'register#new'
  
  # Data controller
  get 'img/:id' => 'data#image'
  
  # Debug paths
  # get 'send' => 'register#send_email'

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
