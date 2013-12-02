Falconmotors::Application.routes.draw do
  resources :vin_cods

  resources :categories

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    passwords: "users/passwords", 
    
   }
  #devise_scope :user do
  #  match 'users/' => 'users/registrations#edit_personal_data', via: [:get, :put], as: :edit_personal_data
  #end
  resources :users do
    
   collection do
      match 'edit_personal_data' => 'users/registrations#edit_personal_data', via: [:get, :put], as: :edit_personal_data
    end
  end
  
  resources :price_parts

  resources :suppliers

  resources :orders do
   collection do
     match 'orders_search' => 'orders#orders_search', via: [:get, :post], as: :orders_search
   end
  end

  resources :brends

  resources :line_items

  resources :carts

  get "store/index"
  get "store/cooperation"
  get "store/contact"
  get "store/useful_info"
  resources :spare_parts do
    get :who_bought, on: :member
    get :quantity_spare, on: :member
    collection do
      match 'search' => 'spare_parts#search', via: [:get, :post], as: :search
    end
  end
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'store#index', as: 'store'

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
