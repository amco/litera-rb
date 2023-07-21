# frozen_string_literal: true

module Litera
  module Configuration
    mattr_accessor :litera_user, default: :current_user
    mattr_accessor :parent_controller, default: "ApplicationController"
    mattr_accessor :authorization, default: ->(user) { user.admin? }

    def setup
      yield(self) if block_given?
    end
  end
end
