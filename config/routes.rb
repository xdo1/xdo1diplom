Diplom::Application.routes.draw do
  resources :discipline_groups

  resources :practices

  resources :plans  do
    collection do
      get 'get_plan_list'
    end
  end

  resources :specialities

  resources :study_years do
    resources :groups
    resources :study_process_graphics
    get 'groups/:group_id/study_process_graphics/new_with_group', to: 'study_process_graphics#new_with_group', as: 'study_process_graphics_new_with_group'
    get 'groups/:group_id/study_process_graphics/edit_with_group', to: 'study_process_graphics#edit_with_group', as: 'study_process_graphics_edit_with_group'
    resources :study_periods
  end

  resources :subjects do
    collection do
      get 'get_subject_list'
    end
  end

  resources :departments

  resources :faculties

  resources :main
  resources :users do
    member do
      post 'change_role'
      post 'change_year'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'

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

  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout
  post 'signin' => 'sessions#create', :as => :signin


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
