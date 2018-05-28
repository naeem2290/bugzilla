class UsersController < ApplicationController


before_action :authorize_user

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
end
