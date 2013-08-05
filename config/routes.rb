BringUp::Application.routes.draw do

  resources :replies

  post "replies/receive" => 'replies#receive', as: 'receive_text'


  resources :parents






  devise_for :teachers

  resources :teachers
  resources :courses do
    resources :messages
  end

  post '/courses/:course_id/messages' => 'messages#create', as: 'week_message'

  match '/courses/:course_id/messages/send' => 'messages#send_message', as: 'send_message'


  root :to => "courses#index"

#                     replies GET    /replies(.:format)                              replies#index
#                             POST   /replies(.:format)                              replies#create
#                   new_reply GET    /replies/new(.:format)                          replies#new
#                  edit_reply GET    /replies/:id/edit(.:format)                     replies#edit
#                       reply GET    /replies/:id(.:format)                          replies#show
#                             PUT    /replies/:id(.:format)                          replies#update
#                             DELETE /replies/:id(.:format)                          replies#destroy
#                     parents GET    /parents(.:format)                              parents#index
#                             POST   /parents(.:format)                              parents#create
#                  new_parent GET    /parents/new(.:format)                          parents#new
#                 edit_parent GET    /parents/:id/edit(.:format)                     parents#edit
#                      parent GET    /parents/:id(.:format)                          parents#show
#                             PUT    /parents/:id(.:format)                          parents#update
#                             DELETE /parents/:id(.:format)                          parents#destroy
#         new_teacher_session GET    /teachers/sign_in(.:format)                     devise/sessions#new
#             teacher_session POST   /teachers/sign_in(.:format)                     devise/sessions#create
#     destroy_teacher_session DELETE /teachers/sign_out(.:format)                    devise/sessions#destroy
#            teacher_password POST   /teachers/password(.:format)                    devise/passwords#create
#        new_teacher_password GET    /teachers/password/new(.:format)                devise/passwords#new
#       edit_teacher_password GET    /teachers/password/edit(.:format)               devise/passwords#edit
#                             PUT    /teachers/password(.:format)                    devise/passwords#update
# cancel_teacher_registration GET    /teachers/cancel(.:format)                      devise/registrations#cancel
#        teacher_registration POST   /teachers(.:format)                             devise/registrations#create
#    new_teacher_registration GET    /teachers/sign_up(.:format)                     devise/registrations#new
#   edit_teacher_registration GET    /teachers/edit(.:format)                        devise/registrations#edit
#                             PUT    /teachers(.:format)                             devise/registrations#update
#                             DELETE /teachers(.:format)                             devise/registrations#destroy
#                    teachers GET    /teachers(.:format)                             teachers#index
#                             POST   /teachers(.:format)                             teachers#create
#                 new_teacher GET    /teachers/new(.:format)                         teachers#new
#                edit_teacher GET    /teachers/:id/edit(.:format)                    teachers#edit
#                     teacher GET    /teachers/:id(.:format)                         teachers#show
#                             PUT    /teachers/:id(.:format)                         teachers#update
#                             DELETE /teachers/:id(.:format)                         teachers#destroy
#             course_messages GET    /courses/:course_id/messages(.:format)          messages#index
#                             POST   /courses/:course_id/messages(.:format)          messages#create
#          new_course_message GET    /courses/:course_id/messages/new(.:format)      messages#new
#         edit_course_message GET    /courses/:course_id/messages/:id/edit(.:format) messages#edit
#              course_message GET    /courses/:course_id/messages/:id(.:format)      messages#show
#                             PUT    /courses/:course_id/messages/:id(.:format)      messages#update
#                             DELETE /courses/:course_id/messages/:id(.:format)      messages#destroy
#                     courses GET    /courses(.:format)                              courses#index
#                             POST   /courses(.:format)                              courses#create
#                  new_course GET    /courses/new(.:format)                          courses#new
#                 edit_course GET    /courses/:id/edit(.:format)                     courses#edit
#                      course GET    /courses/:id(.:format)                          courses#show
#                             PUT    /courses/:id(.:format)                          courses#update
#                             DELETE /courses/:id(.:format)                          courses#destroy
#                week_message POST   /courses/:course_id/messages(.:format)          messages#create
#                        root        /                                               courses#index


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
