require "generators/erb/audited/ui/ui_generator"

module Tailwindcss
  module Generators
    module Audited
      class UiGenerator < Erb::Generators::Audited::UiGenerator
        hide!

        source_root File.expand_path("templates", __dir__)
      end
    end
  end
end
