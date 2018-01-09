Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :tasks do
    collection do
      delete 'delete_multiple'
      post :check_all
    end
  end

  # from todo to done
  get 'change_to_done/:id', to: 'tasks#change_to_done', as: 'change_to_done'
  # from done to todo
  get 'change_to_todo/:id', to: 'tasks#change_to_todo', as: 'change_to_todo'

  get 'check_all', to: 'task#check_all', as: 'check_all'
  root to: 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
