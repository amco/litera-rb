Litera::Engine.routes.draw do
  resources :messages, only: %i[index show]
end
