class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing]

  def home
    redirect_to landing_path unless current_user
  end

  def landing
  end
end
