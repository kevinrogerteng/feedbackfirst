Feedbackfirst::Application.routes.draw do
resources :posts, only: [:index, :create, :delete, :update]
root to: "posts#index"
end
