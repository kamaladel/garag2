Rails.application.routes.draw do
  get 'items/index' 

  get 'items/edit'

  get 'items/show'

  get '/items/', :to => 'items#index', :as => :items

  root 'visits#index'
  get 'visits/:id/new_item_to_visit' => 'visits#new_item_to_visit'
  get 'visits/:id/new_item_visit/' => 'visits#new_item_visit'
  get 'visits/find_car' => 'visits#find_car', as: :find_car
 post 'visits/:id/new_item_visit/' => 'visits#new_item_visit'
 get 'visits/seach_form' => 'visits#seach_form', as: :seach_form
 #get 'visits/create_visit_owner/:owner_id' => 'visits#create_visit_owner'

 post 'visits/create_visit_owner' => 'visits#create_visit_owner', as: :create_visit_owner
    delete 'visits/:id/destroy_item_visit/:item_id' => 'visits#destroy_item_visit'

  resources :items

resources :visits do
 # post :create_item_to_visit, on :item
  resources :owners 
  resources :items
  put :create_item_to_visit, :on => :member
end

patch 'visits/:id/status' => 'visits#status'
  get 'visits/:id/car_visits' => 'visits#car_visits', :as => 'car_visits'

post 'visits/:id/create_item_to_visit' => 'visits#create_item_to_visit'
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
