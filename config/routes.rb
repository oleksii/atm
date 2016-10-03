Rails.application.routes.draw do
  get '/atm' => 'atm#index'
  post '/atm' => 'atm#update'
end
