Feedbackfirst::Application.routes.draw do

  resources :posts 
  resources :tickets, only:[:index]
  resources :sessions
  resources :users, only:[:show] do
    resources :posts, only:[:show]
  end
  root to: "sites#index"

end
