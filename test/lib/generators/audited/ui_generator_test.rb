require "test_helper"
require "generators/audited/ui/ui_generator"

class Audited::UiGeneratorTest < Rails::Generators::TestCase
  tests Audited::UiGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  setup do
    FileUtils.mkdir_p File.join(destination_root, "app/controllers")
    FileUtils.mkdir_p File.join(destination_root, "app/helpers")
    FileUtils.mkdir_p File.join(destination_root, "config")
    FileUtils.mkdir_p File.join(destination_root, "config/locales")

    FileUtils.cp Rails.root.join("config/routes.rb"), File.join(destination_root, "config/routes.rb")
  end

  test "generator runs without errors" do
    run_generator

    assert_file "app/controllers/audits_controller.rb"
    assert_file "app/helpers/audits_helper.rb"

    assert_file "app/views/audits/_filters.html.erb"
    assert_file "app/views/audits/index.html.erb"

    assert_file "config/locales/audited.en.yml"
    assert_file "config/locales/audited.es.yml"

    assert_file "config/routes.rb" do |content|
      assert_match(/resources :audits, only: :index/, content)
      assert_match(/get "audits\/:auditable_type"/, content)
      assert_match(/get "audits\/:auditable_type\/:auditable_id"/, content)
    end
  end
end
