# frozen_string_literal: true

module Litera
  class Message < ApplicationRecord
    validates :body, presence: true
    validates :service, presence: true
    validates :metadata, presence: true
    validates :external_id, presence: true
    validates :published_at, presence: true

    scope :ordered, -> { order(published_at: :desc) }
  end
end
