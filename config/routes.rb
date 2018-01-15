Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pictures#index'
  get '/pictures' => 'pictures#index'

  get '/previous_work' => 'pictures#previous_work'

  get '/pictures_by_year/:year' => 'pictures#pictures_by_year'

  post 'pictures' => 'pictures#create'
  get 'pictures/new' => 'pictures#new'

  get 'pictures/:id/edit' => "pictures#edit"
  patch 'pictures/:id' => "pictures#update"

  delete 'pictures/:id' => 'pictures#destroy'

  get 'pictures/:id' => 'pictures#show'
end
