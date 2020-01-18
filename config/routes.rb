Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "celebs#index"
  post "/create", to: "celebs#create"
  get "/show/:id", to: "celebs#show"
  put "/update/:id", to: "celebs#update"
  delete "/delete/:id", to: "celebs#destroy"
end
