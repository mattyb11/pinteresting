Rails.application.routes.draw do

  resources :drafts do
    collection do
      get :order
      get :picks
      get :needs
    end
  end

  resources :performances do
    resources :players
  end

  resources :players do
    collection do
      get :rankings
      get :depthchart
      get :trademachine
      get :aaron
      get :alex
      get :aryeh
      get :davidg
      get :davidh
      get :davids
      get :ilan
      get :isaac
      get :jeremy
      get :noah
      get :oliver
      get :solly
      get :zack
    end
    resources :performances
  end

  resources :prospects do
    collection do
      get :depthchart
    end
  end

  devise_for :users, controllers: { registrations: 'registrations'}
  root "pages#home"
  get "about" => "pages#about"

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
