Rails.application.routes.draw do
  # http://localhost:3000/requests/Hopkins/08/2015
  get "/requests/:alderman/:month/:year" => "requests#show"
end
