Feedbackfirst::Application.routes.draw do
  get "tickets/index"
resources :posts, only: [:index, :create, :delete, :update, :show]
root to: "sites#index"
end
