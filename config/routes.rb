Rails.application.routes.draw do
  devise_for :users
# Good job setting up a redirect for the root

root 'books#index'
resources :books do
  resources :reviews
end

end
