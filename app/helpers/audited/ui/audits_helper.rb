module Audited
  module Ui
    module AuditsHelper
      def sort_link(column)
        direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
        title = I18n.t "activerecord.attributes.audit.#{column}"

        title = if column == sort_column
          "#{title} #{(sort_direction == "asc") ? "▲" : "▼"}"
        else
          title
        end

        _with_routes audited_ui.routes do
          link_to title, {sort: column, direction: direction}
        end
      end

      def title(auditable, auditable_type)
        if auditable.present?
          I18n.t "audited.ui.audits.index.title.auditable", auditable: auditable.to_s
        elsif auditable_type.present?
          I18n.t "audited.ui.audits.index.title.auditable_type", auditable_type: auditable_type.to_s.humanize.pluralize.downcase
        else
          I18n.t "audited.ui.audits.index.title.all"
        end
      end
    end
  end
end
