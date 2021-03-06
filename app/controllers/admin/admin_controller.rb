class Admin::AdminController < ApplicationController
  before_action :logged_in_user, :is_admin?

  private

  def is_admin?
    return if current_user.admin?
    redirect_to login_path
  end
end
