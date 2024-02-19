require "audited/ui/version"
require "audited/ui/engine"
require "kaminari"
require "ransack"

module Audited
  module Ui
  end

  class Audit < ::ActiveRecord::Base
    ransacker :raw_audited_changes, type: :text do
      Arel.sql "audited_changes::text"
    end

    def self.ransackable_associations(auth_object = nil)
      [
        "associated",
        "auditable",
        "user"
      ]
    end

    def self.ransackable_attributes(auth_object = nil)
      [
        "action",
        "associated_id",
        "associated_type",
        "auditable_id",
        "auditable_type",
        "audited_changes",
        "comment",
        "created_at",
        "id",
        "raw_audited_changes",
        "remote_address",
        "request_uuid",
        "user_id",
        "user_type",
        "username",
        "version"
      ]
    end
  end
end
