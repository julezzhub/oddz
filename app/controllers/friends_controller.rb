
class FriendsController < ApplicationController
  after_action :skip_authorization
  after_action :skip_policy_scope

  def index
  end

  def request_friend
    friended_user = User.find_by(username: params[:username])
    current_user.friend_request(friended_user)
    redirect_to friends_path
  end

  def accept_friend
    friended_user = User.find(params[:id])
    current_user.accept_request(friended_user)
    redirect_to friends_path
  end

  def decline_friend
    friended_user = User.find(params[:id])
    current_user.decline_request(friended_user)
    redirect_to friends_path
  end
end
