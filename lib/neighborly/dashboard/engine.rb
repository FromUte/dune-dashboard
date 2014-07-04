module Neighborly
  module Dashboard
    class Engine < ::Rails::Engine
      isolate_namespace Neighborly::Dashboard

      initializer 'neighborly.dashboard.assets.precompile' do |app|
        app.config.assets.paths << Neighborly::Dashboard::Engine.root.join('vendor', 'assets', 'components')
        app.config.assets.precompile += %w(neighborly-dashboard-application.css neighborly-dashboard-libs.js neighborly-dashboard-application.js neighborly-dashboard-templates.js)
      end
    end
  end
end
