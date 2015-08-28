require "spec_helper"

if ENV['CI']
  require 'active_support/core_ext/kernel/reporting'

  describe "CoverageHelper" do
    it "should require the world" do
      %w(app gems lib spa_ui).each do |path|
        Dir.glob(Rails.root.join(path, "**", "*.rb")) do |file|
          next if file.include?("/spec/") || file.include?("/test/") || file.include?("test.rb")
          begin
            silence_warnings { require file }
          rescue StandardError, LoadError, MissingSourceFile
          end
        end
      end
    end
  end
end
