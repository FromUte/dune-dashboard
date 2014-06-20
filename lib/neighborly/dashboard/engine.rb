module Neighborly
  module Dashboard
    class Engine < ::Rails::Engine
      isolate_namespace Neighborly::Dashboard
    end
  end
end
