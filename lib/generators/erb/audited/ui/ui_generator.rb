require "rails/generators/erb"

module Erb
  module Generators
    module Audited
      class UiGenerator < Rails::Generators::Base
        hide!

        source_root File.expand_path("templates", __dir__)

        def create_views
          template "app/views/audits/_filters.html.erb"
          template "app/views/audits/index.html.erb"
        end
      end
    end
  end
end
