Feedbackfirst::Application.routes.draw do
  get "tickets/index"
resources :posts, only: [:index, :create, :delete, :update, :show]
resources :tickets, only:[:index]
root to: "sites#index"
end
