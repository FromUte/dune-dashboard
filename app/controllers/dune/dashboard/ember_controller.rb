module Dune::Dashboard
  class EmberController < ActionController::Base
    def index
      render template: 'layouts/dune/dashboard/application', layout: false
    end
  end
end
