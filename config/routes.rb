Audited::Ui::Engine.routes.draw do
  scope module: :audited do
    scope module: :ui do
      resources :audits, only: :index

      get "audits/:auditable_type", to: "audits#index", as: "auditable_type_audits"
      get "audits/:auditable_type/:auditable_id", to: "audits#index", as: "auditable_audits"
    end
  end
  root to: redirect("audits")
end
