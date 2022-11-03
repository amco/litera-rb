# frozen_string_literal: true

module Litera
  class MessageJob < ApplicationJob
    def perform(data = {})
      Litera::Message.create!(data)
    end
  end
end
