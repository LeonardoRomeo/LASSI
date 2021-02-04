Rails.application.routes.draw do

  root 'welcome#index'
 
  
  devise_for :students, path: 'students', controllers: {sessions: "students/sessions", :omniauth_callbacks =>  "students/omniauth_callbacks" }

  get 'auth/facebook/callback', to: 'students/omniauth_callbacks#facebook'
  
  

  #risorse gestite dagli studenti
  resources :docs
  resources :notes
  resources :posts do
    resources :answers
  end
  
  #risorse gestite dalle terze parti
  resources :rooms do
    resources :reservations
  end  
  
  

  resources :searches
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
