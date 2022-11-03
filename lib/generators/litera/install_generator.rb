# frozen_string_literal: true

module Litera
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)
      desc "Creates litera initializer."

      def create_initializer
        template "litera.rb", "config/initializers/litera.rb"
      end
    end
  end
end
