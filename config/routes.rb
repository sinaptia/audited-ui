Rails.application.routes.draw do
  scope "audited", module: "audited/ui" do
    resources :audits, only: :index, as: "audited_audits"

    get "audits/:auditable_type", to: "audits#index", as: "audited_auditable_type_audits"
    get "audits/:auditable_type/:auditable_id", to: "audits#index", as: "audited_auditable_audits"
  end
end
