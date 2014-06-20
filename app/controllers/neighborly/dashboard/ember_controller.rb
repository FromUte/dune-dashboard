module Neighborly::Dashboard
  class EmberController < ActionController::Base
    def index
      render template: 'layouts/neighborly/dashboard/application', layout: false
    end
  end
end
