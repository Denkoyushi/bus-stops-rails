BusSystem::Application.routes.draw do

  match('/', {:via => :get, :to => 'lines#index'})
  resources :lines

  resources :buses, :except => :index

  resources :stations

  resources :arrivals, :only => [:edit, :create, :destroy]
end
