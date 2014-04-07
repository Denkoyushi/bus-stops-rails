BusSystem::Application.routes.draw do

  match('/', {:via => :get, :to => 'lines#index'})
  resources :lines

  resources :buses

  resources :stations

end
