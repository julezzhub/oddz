class Account::SettingsController < ApplicationController
	after_action :skip_authorization
  after_action :skip_policy_scope

	def setting
	end
end
