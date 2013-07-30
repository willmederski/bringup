BringUp::Application.routes.draw do
  get "recipients/response"

  resources :courses


  devise_for :teachers
  resources :teachers

  root :to => "courses#index"

  #recipients POST /recipients/response(.:format)      recipients#response

  

#                      teachers GET    /teachers(.:format)               teachers#index
#                             POST   /teachers(.:format)               teachers#create
#                 new_teacher GET    /teachers/new(.:format)           teachers#new
#                edit_teacher GET    /teachers/:id/edit(.:format)      teachers#edit
#                     teacher GET    /teachers/:id(.:format)           teachers#show
#                             PUT    /teachers/:id(.:format)           teachers#update
#                             DELETE /teachers/:id(.:format)           teachers#destroy
#         new_teacher_session GET    /teachers/sign_in(.:format)       devise/sessions#new
#             teacher_session POST   /teachers/sign_in(.:format)       devise/sessions#create
#     destroy_teacher_session DELETE /teachers/sign_out(.:format)      devise/sessions#destroy
#            teacher_password POST   /teachers/password(.:format)      devise/passwords#create
#        new_teacher_password GET    /teachers/password/new(.:format)  devise/passwords#new
#       edit_teacher_password GET    /teachers/password/edit(.:format) devise/passwords#edit
#                             PUT    /teachers/password(.:format)      devise/passwords#update
# cancel_teacher_registration GET    /teachers/cancel(.:format)        devise/registrations#cancel
#        teacher_registration POST   /teachers(.:format)               devise/registrations#create
#    new_teacher_registration GET    /teachers/sign_up(.:format)       devise/registrations#new
#   edit_teacher_registration GET    /teachers/edit(.:format)          devise/registrations#edit
#                             PUT    /teachers(.:format)               devise/registrations#update
#                             DELETE /teachers(.:format)               devise/registrations#destroy
#                        root        /                                 teachers#index


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
  # match ':controller(/:action(/:id))(.:format)'
end
