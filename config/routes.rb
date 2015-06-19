SampleApp::Application.routes.draw do

  # Добавление ресурса для получения стандартных RESTful действий
  resources :users, except: :index
  resources :sessions, only: [:new, :create, :destroy]

  root                  'static_pages#home'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  match '/signup',  to: 'users#new',            via: 'get'

  resources :events, only: [:index, :show] do
    resources :registrations, only: :create
  end

  namespace :admin do
    root 'events#index'
    resources :events do
      resources :registrations, only: :index
    end
    resources :registrations, only: [] do
      resources :payments
    end
    resources :event_templates
    resources :users, except: :show
  end

end
