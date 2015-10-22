Rails.application.routes.draw do
  # get 'projects/show'

  # get 'projects/index'

  # get 'projects/new'

  # get 'projects/create'

  # get 'projects/edit'

  resources :causes
  post 'causes/:id/donate' => 'causes#paypal'
  post "/hook" => "causes#hook"
  get "/donation" => "causes#invoice", as: 'donation'
  post "projects/add_resource" => "projects#add_resource"
  post "projects/add_service" => "projects#add_service"
  post "projects/add_mentor" => "projects#add_mentor"

  resources :scholarships

  resources :projects

  devise_for :users, :controllers => { registrations: 'registrations' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'application#home'
  get 'community' => 'application#community'
  get 'arts' => 'application#arts'
  get 'my-projects' => 'application#my_projects'

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
