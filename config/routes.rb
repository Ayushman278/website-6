Rails.application.routes.draw do

  devise_for :users, path_names: { sign_up: '' }

  root to: "home#index"

  get '/contact_us',
    to: 'home#contact_us'

  get '/sign_up',
    to: 'home#sign_up',
    as: 'sign_up'

  post '/request_token_email',
    to: 'home#request_token_email',
    as: 'request_token_email'

  get '/rsvp',
    to: 'home#rsvp'
  post '/rsvp_update',
    to: 'home#new_member', as: 'rsvp_members'
  patch '/rsvp_update.:id',
    to: 'home#rsvp_update', as: 'rsvp_member'

  post '/email_admin',
    to: 'home#email_admin', as: 'email_admin'

  namespace :admin do
    root to: "events#index", as: 'root'
    resources :events
    resources :members
    post '/mailings/send/:id',
      to: 'mailings#sender', as: 'mailing_sender'
    resources :mailings
    get '/members/export',
      to: 'members#export'
    post '/members/import',
      to: 'members#import'
    post '/members/mass_destroy',
      to: 'members#mass_destroy'
    get '/event_mail_logs',
      to: 'event_mail_logs#index'
  end

end
