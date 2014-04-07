BusSystem::Application.routes.draw do

  match('/', {:via => :get, :to => 'lines#index'})
  resources :lines do
    resources :stops
  end

  resources :stations

end
