Neighborly::Dashboard::Engine.routes.draw do
  root to: 'ember#index'
  get ':any', to: 'ember#index'
end
