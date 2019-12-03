class FriendsController < ApplicationController
  after_action :skip_authorization
  after_action :skip_policy_scope

  def index
  end

  def request_friend
    friended_user = User.find_by(username: params[:username])
    current_user.friend_request(friended_user)
    respond_to do |format|
      format.html { render 'friends' }
      format.js
    end
  end

  def accept_friend
    @friended_user = User.find(params[:id])
    current_user.accept_request(@friended_user)
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
