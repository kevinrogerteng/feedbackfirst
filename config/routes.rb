Feedbackfirst::Application.routes.draw do
  get "users/create"
  get "tickets/index"
resources :posts, only: [:index, :create, :delete, :update, :show] 
resources :tickets, only:[:index]
resources :sessions
root to: "sites#index"
end
