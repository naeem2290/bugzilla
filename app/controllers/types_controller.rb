class TypesController < ApplicationController
  before_action :authorize_user
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  def manager
    @projects = Project.where(user_id: current_user.id)
  end

  def qa
    @projects = Project.all
    @bug = Bug.all
  end

  def developer
    @project = Project.all
    @developer = UserProject.all
  end


private
  def authorize_user
    @user = User.find(current_user.id)
    authorize @user
  end

  def not_authorized
    flash[:alert]="You must be logged in first"
    redirect_to root_path
  end
end
