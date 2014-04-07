BusSystem::Application.routes.draw do

  match('/', {:via => :get, :to => 'lines#index'})
  resources :lines do
    resources :buses
  end

  resources :stations

end
