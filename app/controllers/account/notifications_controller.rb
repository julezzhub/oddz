class Account::NotificationsController < ApplicationController
  after_action :skip_authorization
  after_action :skip_policy_scope

  def index
    @real_notifications = Notification.where(user_id: current_user)
    @notifications = @real_notifications.each { |n| n.dup }
    @real_notifications.each do |notification|
      notification.update(seen: true)

    end
  end
end