# frozen_string_literal: true

Litera.setup do |config|
  # Configure what is the name of the method that returns the current
  # logged in user in your application.
  # config.litera_user = :current_user

  # Setup the name of the main application controller in your application.
  # config.parent_controller = "ApplicationController"

  # Define how the current user will be authorized ot not to access the
  # messages dashboard.
  # config.authorization = -> (user) do
  # user.admin?
  # end
end
