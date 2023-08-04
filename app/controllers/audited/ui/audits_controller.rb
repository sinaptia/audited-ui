module Audited
  module Ui
    class AuditsController < ::ApplicationController
      before_action :set_auditable_type
      before_action :set_auditable
      before_action :set_audits

      def index
        @audits = @audits.reorder("#{sort_column}": sort_direction).page params[:page]
      end

      private

      def set_auditable
        @auditable = if @auditable_type.present? && params[:auditable_id].present?
          @auditable_type.find params[:auditable_id]
        end
      end

      def set_auditable_type
        @auditable_type = if params[:auditable_type].present?
          params[:auditable_type].camelize.constantize
        end
      end

      def set_audits
        @audits = if @auditable.present?
          @auditable.audits
        elsif @auditable_type.present?
          Audited::Audit.where(auditable_type: @auditable_type.to_s)
        else
          Audited::Audit.all
        end
      end

      def sort_column
        Audited::Audit.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
      end
      helper_method :sort_column

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
      end
      helper_method :sort_direction
    end
  end
end
