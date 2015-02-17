module Dune
  module Dashboard
    class Engine < ::Rails::Engine
      isolate_namespace Dune::Dashboard

      initializer 'dune.dashboard.assets.precompile' do |app|
        app.config.assets.paths << Dune::Dashboard::Engine.root.join('vendor', 'assets', 'components')
        app.config.assets.precompile += %w(dune-dashboard-application.css dune-dashboard-libs.js dune-dashboard-application.js dune-dashboard-templates.js)
      end
    end
  end
end
