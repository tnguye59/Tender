Rails.application.routes.draw do

  get 'general_questions/new'

  get 'user_questions/new'

  root "users#index"
  #Users
  get "/" => "users#index"
  get "login" => "users#login"
  get "register" => "users#register"
  get "user/:id" => "users#show"
  post "users" => "users#create"
  get "match/:id" => "users#match"
  get "users/:id/edit" => "users#edit"
  patch "users/:id/update" => "users#update"
  get "users/:id/profile" => "users#profile"
  get "aboutus" => "users#aboutus"
  #Sessions
  post "session" => "sessions#create"
  get "logout" => "sessions#destroy"
  #PersonalQuestions
  get 'personal' => "personal_questions#new"
  post 'personal'=> "personal_questions#create"
  get 'personal/:id/edit' => "personal_questions#edit"
  patch 'personal/:id/edit' => "personal_questions#update"
  get 'questions/:id' => "personal_questions#show"
  #GeneralQuestions
  get 'general' => 'general_questions#new'
  post 'general' => 'general_questions#create'

  #Chat
  get 'chat' => "comments#chat"
 
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
