Rails.application.routes.draw do
  get "/", to: "celebs#index"
  post "/create", to: "celebs#create"
  get "/show/:id", to: "celebs#show"
  put "/update/:id", to: "celebs#update"
  delete "/delete/:id", to: "celebs#destroy"
end
