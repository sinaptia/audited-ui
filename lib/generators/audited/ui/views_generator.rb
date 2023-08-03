module Audited
  module Ui
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../../app/views/audited/ui", __FILE__)

      def copy_views
        directory :audits, "app/views/audited/ui/audits"
      end
    end
  end
end
