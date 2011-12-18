Concept::Application.routes.draw do
  get "about", :controller => 'common'
  get "contact_us", :controller => 'common'
  get "terms_privacy", :controller => 'common'
  get "faq", :controller => 'common'
  get "share", :controller => 'common'

  resources :searches

  devise_for :users
  resources :users, :only => :show
  resources :search, :except => [:edit, :update, :destroy]
  resources :organizations, :only => [:index, :show]
  resources :locations, :only => [:index, :show]
  resources :venues, :only => [:index, :show]
  resources :ammenities, :only => :show
  resources :services, :only => :show
  resources :activities, :only => :show

  namespace :manage do
    resources :organizations, :shallow =>true do 
      resources :locations do
        resources :venues do

        end
      end
    end
    resources :activities, :services, :ammenities
  end

  #resources :organizations, :only => [:index, :show], :shallow => true do
  #  resources :locations, :only => [:index, :show] do
  #    resources :venues, :only => :show do
  #      
  #    end
  #  end
  #end

  #get \"users\/show\"

  #match 'common/:action'

  root :to => "home#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
