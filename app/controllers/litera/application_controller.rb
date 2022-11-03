# frozen_string_literal: true

module Litera
  class ApplicationController < Litera.parent_controller.constantize
    before_action :authorize_litera_user

    private

    def litera_user
      send(Litera.litera_user)
    end

    def authorize_litera_user
      if !Litera.authorization.call(litera_user)
        raise Litera::Errors::NotAuthorized
      end
    end
  end
end
