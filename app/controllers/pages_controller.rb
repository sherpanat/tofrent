class PagesController < ApplicationController
  def home
    @registration_application = ::RegistrationApplication.new
  end
end
