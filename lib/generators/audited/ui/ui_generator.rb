class Audited::UiGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  hook_for :template_engine, as: :"audited:ui"

  def create_audits_controller
    template "app/controllers/audits_controller.rb"
  end

  def create_audits_helper
    template "app/helpers/audits_helper.rb"
  end

  def create_locale_files
    template "config/locales/audited.en.yml"
    template "config/locales/audited.es.yml"
  end

  def configure_routes
    route "get \"audits/:auditable_type/:auditable_id\", to: \"audits#index\", as: \"auditable_audits\""
    route "get \"audits/:auditable_type\", to: \"audits#index\", as: \"auditable_type_audits\""
    route "resources :audits, only: :index"
  end
end
