module AuditsHelper
  def title(auditable, auditable_type)
    if auditable.present?
      I18n.t "audits.index.title.auditable", auditable: auditable.to_s
    elsif auditable_type.present?
      I18n.t "audits.index.title.auditable_type", auditable_type: auditable_type.to_s.humanize.pluralize.downcase
    else
      I18n.t "audits.index.title.all"
    end
  end
end
