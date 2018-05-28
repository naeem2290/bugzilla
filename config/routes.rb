Rails.application.routes.draw do
  devise_for :users

get 'developer_proj', action: :developer_proj, controller: 'bugs'

get 'assign_bugs', action: :assign, controller: 'bugs'

get 'assign', action: :assigned, controller: 'bugs'

get 'resolve_bugs', action: :resolve, controller: 'bugs'

root to: "home#index"

resources :projects do

resources :bugs
 member do
   get 'delete_member'
   get 'display'
   post 'member'
   post 'remove_member'


end

end



get 'manager', action: :manager, controller: 'types'

get 'developer', action: :developer, controller: 'types'

get 'qa', action: :qa, controller: 'types'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
