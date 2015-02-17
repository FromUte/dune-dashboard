Rails.application.routes.draw do
  mount Dune::Dashboard::Engine => '/dashboard/', as: :dune_dashboard
end
