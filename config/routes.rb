Rails.application.routes.draw do
  root to:'toppages#index'

  resources:categories do
    resources:blogs
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
