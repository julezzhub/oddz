class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing]

  def home
    unless current_user
      redirect_to landing_path
    end
  end

  def landing
  end
end
