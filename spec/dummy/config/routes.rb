Rails.application.routes.draw do
  mount Neighborly::Dashboard::Engine => '/dashboard/', as: :neighborly_dashboard
end
