Rails.application.routes.draw do

  resources :password_resets

  resources :sessions, only: [:new, :create, :destroy]

  resources :admins, controller: 'users', type: 'Admin'
  resources :instructors, controller: 'users', type: 'Instructor'
  resources :teaching_assistants, controller: 'users', type: 'TeachingAssistant'
  
  resources :students, controller: 'users', type: 'Student' do
    resources :enrollments
    resources :submissions, only: :show
  end

  resources :locations
  resources :courses
  resources :cohorts
  resources :comments

  resources :users

  resources :assignments do
    resources :submissions
    resources :comments
  end
  
  resources :submissions do
    resources :comments
  end

  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  get "reset_password" => "sessions#reset_password"
  post "reset_password/sending" => "sessions#send_reset_code"

  root 'users#index'
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
