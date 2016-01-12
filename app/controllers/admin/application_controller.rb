class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :check_privileges

  def index

  end

  private
  def check_privileges
    redirect_to root_path unless current_user.is_admin?
  end
end