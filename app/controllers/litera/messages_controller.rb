module Litera
  class MessagesController < ApplicationController
    include Pagy::Backend

    def index
      @pagy, @messages = pagy(Message.all)
    end

    def show
      @message = Message.find(params[:id])
    end
  end
end
