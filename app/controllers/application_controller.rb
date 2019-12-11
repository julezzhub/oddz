class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :remove_expired_pending_bets

  include Pundit

  after_action :verify_authorized, except: [:pending, :index], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:pending, :index], unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def remove_expired_pending_bets
    bets_to_remove = Bet.expired_pending_bets
    bets_to_remove.each { |bet| bet.update(status: false) }
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
