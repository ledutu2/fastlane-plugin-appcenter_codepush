require 'fastlane/action'
require_relative '../helper/appcenter_codepush_helper'

module Fastlane
  module Actions
    class AppcenterCodepushAction < Action
      def self.run(params)
        UI.message("The appcenter_codepush plugin is working!")
        sh "pwd"
        # sh "cd .. && code-push release-react #{params[:owner_name]}/#{params[:my_app]} #{params[:platform]} -d #{params[:env]}"
      end

      def self.description
        "Plugin for codepush to appcenter"
      end

      def self.authors
        ["ledutu"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Plugin for codepush to appcenter quickly"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :env,
                                       env_name: "FL_ENVIRONMENT", # The name of the environment variable
                                       description: "ENV for CodePushAction", # a short description of this parameter
                                       verify_block: proc do |value|
                                          UI.user_error!("No env for CodePushAction given, pass using `env: 'env'`") unless (value and not value.empty?)
                                          # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
                                       end),
          FastlaneCore::ConfigItem.new(key: :owner_name,
                                      env_name: "FL_OWNER_NAME", # The name of the environment variable
                                      description: "Owner Name for CodePushAction", # a short description of this parameter
                                      verify_block: proc do |value|
                                        UI.user_error!("No owner name for CodePushAction given, pass using `owner_name: 'owner_name'`") unless (value and not value.empty?)
                                        # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
                                      end),
          FastlaneCore::ConfigItem.new(key: :my_app,
                                      env_name: "FL_MY_APP", # The name of the environment variable
                                      description: "My App for CodePushAction", # a short description of this parameter
                                      verify_block: proc do |value|
                                        UI.user_error!("No my app name for CodePushAction given, pass using `my_app: 'my_app'`") unless (value and not value.empty?)
                                        # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
                                      end),
          FastlaneCore::ConfigItem.new(key: :platform,
                                      env_name: "FL_FLATFORM", # The name of the environment variable
                                      description: "Platform for CodePushAction", # a short description of this parameter
                                      verify_block: proc do |value|
                                        UI.user_error!("No flatform for CodePushAction given, pass using `platform: 'platform'`") unless (value and not value.empty?)
                                        # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
                                      end)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
