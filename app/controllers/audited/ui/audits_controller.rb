module Audited
  module Ui
    class AuditsController < ::ApplicationController
      before_action :set_auditable_type
      before_action :set_auditable
      before_action :set_audits

      def index
        @q = @audits.ransack params[:q]
        @q.sorts = "created_at desc" if @q.sorts.none?
        @audits = @q.result(distinct: true).page params[:page]
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
    end
  end
end
