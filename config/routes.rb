Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match 'events/' => 'events#index', :via => [:get]
  match 'events/' => 'events#create', :via => [:post]
  match 'events/:id' => 'events#show', :via => [:get]
  match 'events/:id' => 'events#update', :via => [:put, :patch]
  match 'events/:id' => 'events#destroy', :via => [:delete]

  match 'tickets/' => 'tickets#index', :via => [:get]
  match 'tickets/' => 'tickets#create', :via => [:post]
  match 'tickets/:id' => 'tickets#show', :via => [:get]
  match 'tickets/:id' => 'tickets#update', :via => [:put, :patch]
  match 'tickets/:id' => 'tickets#destroy', :via => [:delete]

  root 'application#hello'

end
