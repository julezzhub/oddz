class Account::SettingsController < ApplicationController
  after_action :skip_authorization, except: [:wallet]
  after_action :skip_policy_scope, except: [:wallet]

  def setting
  end

  def wallet
    @amount = 50
    authorize :settings
  end
end
