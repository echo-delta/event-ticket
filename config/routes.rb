Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'static_pages/home'

  match 'events/' => 'events#index', :via => [:get]
  match 'events/:id' => 'events#show', :via => [:get]
  match 'events/create' => 'events#create', :via => :post

  root 'application#hello'

end
