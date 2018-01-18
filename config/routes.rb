Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pictures#index'

  resources :pictures

  get '/previous_work' => 'pictures#previous_work'

  get '/pictures_by_year/:year' => 'pictures#pictures_by_year'

end
