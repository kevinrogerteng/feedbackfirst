Feedbackfirst::Application.routes.draw do
resources :posts, only: [:index, :create, :delete, :update, :show]
root to: "sites#index"
end
