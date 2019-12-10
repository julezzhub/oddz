class FriendsController < ApplicationController
  after_action :skip_authorization
  after_action :skip_policy_scope

  def index
  end

  def request_friend
    @friended_user = User.find_by(username: params[:username].downcase)
    if @friended_user
      current_user.friend_request(@friended_user)
      notification = Notification.new(user: @friended_user, notifiable: current_user, category: "New Friend Request")
      notification.save
      respond_to do |format|
        format.html { render 'friends' }
        format.js
      end
    end
  end

  def accept_friend
    @friended_user = User.find(params[:id])
    current_user.accept_request(@friended_user)
    notification = Notification.new(user: @friended_user, notifiable: current_user, category: "Accepted Friend Request")
    notification.save
    respond_to do |format|
      format.html { render 'friends' }
      format.js
    end

  end

  def decline_friend
    @friended_user = User.find(params[:id])
    current_user.decline_request(@friended_user)
    respond_to do |format|
      format.html { render 'friends' }
      format.js
    end
  end
end
