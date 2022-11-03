# frozen_string_literal: true

module Litera
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
