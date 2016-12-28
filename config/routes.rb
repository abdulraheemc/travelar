Rails.application.routes.draw do
  #devise_for :users, :controllers => { registrations: 'registrations' }

  get 'agencies/approval'
  post 'agencies/new'
  post 'packages/:id/new',to: "packages#new" , as: "packages_agency"
  get 'agencies/:id/approve', :to => 'agencies#approve', :as => 'parvez'

  get 'home/contact_us'
  get 'home/about_us'
  get 'home/home_page'
  get 'pilgrim/:id/new' , to: "pilgrim#new", as: "pilgrim_new"
  
  resources :agents  
  post 'pilgrim/create'
  get 'pilgrim/show'
  get 'pilgrim/index'


  resources :packages
  get 'home/index'
  post 'home/index'
  get 'book_now/:id' , to: "home#book_now", as: "book_now"
  resource :home do
    member do
  get 'home/traveler_dashboard'
  post 'home/traveler_dashboard'
  get 'home/agnet_dashboard'
  get 'home/search'
   end
  end
  
  resources :agencies
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'home/user_dashboard'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
