class PagesController < ApplicationController
  def home
    @registration_membership = ::RegistrationMembership.new
  end
end
