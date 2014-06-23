Neighborly::Dashboard::Engine.routes.draw do
  root to: 'ember#index'
  get '*path', to: 'ember#index'
end
