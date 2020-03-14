Rails.application.routes.draw do
  root to: 'books#top'
  resources :books
  patch 'books/:id' => 'books#update', as: 'update_books'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
