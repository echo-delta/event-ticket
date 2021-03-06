Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match 'events/' => 'events#index', :via => [:get]
  match 'events/' => 'events#create', :via => [:post]
  match 'events/:id' => 'events#show', :via => [:get]
  match 'events/:id' => 'events#update', :via => [:put]
  match 'events/:id' => 'events#destroy', :via => [:delete]

  match 'tickets/' => 'tickets#index', :via => [:get]
  match 'tickets/' => 'tickets#create', :via => [:post]
  match 'tickets/:id' => 'tickets#show', :via => [:get]
  match 'tickets/:id' => 'tickets#update', :via => [:put]
  match 'tickets/:id' => 'tickets#destroy', :via => [:delete]

  match 'invoices/' => 'invoices#index', :via => [:get]
  match 'invoices/' => 'invoices#create', :via => [:post]
  match 'invoices/:id' => 'invoices#show', :via => [:get]
  match 'invoices/:id' => 'invoices#update', :via => [:put]
  match 'invoices/:id' => 'invoices#destroy', :via => [:delete]

  match 'users/' => 'users#index', :via => [:get]
  match 'users/' => 'users#create', :via => [:post]
  match 'users/:id' => 'users#show', :via => [:get]
  match 'users/:id' => 'users#update', :via => [:put]

  match 'venues/' => 'venues#index', :via => [:get]
  match 'venues/' => 'venues#create', :via => [:post]
  match 'venues/:id' => 'venues#show', :via => [:get]
  match 'venues/:id' => 'venues#update', :via => [:put]
  match 'venues/:id' => 'venues#destroy', :via => [:delete]

  match '/venues/:venue_id/sections/' => 'sections#index', :via => [:get]
  match '/venues/:venue_id/sections/' => 'sections#create', :via => [:post]
  match '/venues/:venue_id/sections/:id' => 'sections#show', :via => [:get]
  match '/venues/:venue_id/sections/:id' => 'sections#update', :via => [:put]
  match '/venues/:venue_id/sections/:id' => 'sections#destroy', :via => [:delete]

  match '/BookEvent/BookEvent' => 'transactions#book_event', :via => [:post]
  match '/PayInvoice' => 'transactions#pay_invoice', :via => [:post]
  match '/CancelTicket' => 'transactions#cancel_ticket', :via => [:post]
  match '/CancelSection' => 'transactions#cancel_section', :via => [:post]
  match '/GiftTicket' => 'transactions#gift_ticket', :via => [:post]
  match '/UpdateSections' => 'transactions#update_sections', :via => [:post]

  root 'application#hello'

end
