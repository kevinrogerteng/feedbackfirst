Feedbackfirst::Application.routes.draw do
  get "users/create"
  get "tickets/index"
resources :posts 
resources :tickets, only:[:index]
resources :sessions
root to: "sites#index"
end
