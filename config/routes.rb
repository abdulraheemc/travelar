Rails.application.routes.draw do
  get 'checkouts/stripe_checkout'
  post 'stripe_checkout' => 'checkouts#stripe_checkout'

  #devise_for :users, :controllers => { registrations: 'registrations' }

  get 'agencies/approval'
  post 'agencies/new'
  get 'agencies/:id/approve', :to => 'agencies#approve', :as => 'parvez'

  get 'home/contact_us'
  get 'home/about_us'
  get 'home/home_page'
  get 'home/index'
  post 'home/index'
  
  post 'packages/:id/new',to: "packages#new" , as: "packages_agency"

  
  get 'pilgrim/:id/new' , to: "pilgrim#new", as: "pilgrim_new"
  post 'pilgrim/create'
  get 'pilgrim/show'
  get 'pilgrim/index'

  #devise_for :users
  resources :agents 
  resources :packages do
    collection do
      get 'search_packages'
      post 'search_packages'
    end
  end
  resources :agencies
  devise_for :users, :controllers => { registrations: 'registrations' } 
  
  get 'book_now/:id' , to: "home#book_now", as: "book_now"
  resource :home do
    member do
  get 'home/traveler_dashboard'
  post 'home/traveler_dashboard'
  get 'home/agnet_dashboard'
  get 'home/search'
  get 'home/umrahpackage'
  get 'home/hajjpackage'
   end
  end 
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'home/user_dashboard'
 
  root 'home#index'



end
