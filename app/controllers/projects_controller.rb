class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

# GET /projects
# GET /projects.json
def index
  @projects = Project.where(user_id: current_user.id)
  authorize @projects
end

# GET /projects/1
# GET /projects/1.json
def show
    @userprojects = UserProject.where(project_id: params[:id])
    @user =  User.where(project_id: params[:id])
    @bug = Bug.where(project_id: params[:id])
end

def display
  @user = User.all
  @project = Project.find(params[:id])
end


def delete_member
  @userprojects= UserProject.where(project_id: params[:id])
  @user = User.where(project_id: params[:id])
end


def remove_member
   puts '***'*1000
  puts params
  delete_user = params[:UserProject]['user']
  delete_user.each do |user|
    if user!=" "
      UserProject.where(user_id: user, project_id: params[:id]).destroy_all
    end
  end
  redirect_to manager_path
end



def member

  user = params[:UserProject]['user']
  user.each do |up|
    if up !=" "
      duplicate = UserProject.where(user_id: up, project_id: params[:id])
      if !duplicate.present?
        @new = UserProject.new(user_project_params.merge(user_id:  up, project_id: params[:id]))
        @new.save
      else
        flash[:alert] = 'Developers/QA already assigned'
        redirect_to manager_path
      end
    end
  end
end


# GET /projects/new
def new
  @project = Project.new
  @userproject= UserProject.new
end

# GET /projects/1/edit
def edit
end

# POST /projects
# POST /projects.json
def create
user =User.where(id: current_user.id).update(project_id: params[:id]).first
  @project = Project.new(project_params.merge(user_id: current_user.id))
  @project.save
  respond_to do |format|
    if @project.save
      format.html { redirect_to @project, notice: 'project was successfully created.' }
    else
      format.html { render :new }
    end
  end
end

# PATCH/PUT /projects/1
# PATCH/PUT /projects/1.json
def update
  respond_to do |format|
    if @project.update(project_params)
      format.html { redirect_to @project, notice: 'project was successfully updated.' }
      format.json { render :show, status: :ok, location: @project }
    else
      format.html { render :edit }
      format.json { render json: @project.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /projects/1
# DELETE /projects/1.json
def destroy
  UserProject.where(project_id: params[:id]).destroy_all
  @project.destroy
  respond_to do |format|
    format.html { redirect_to manager_path, notice: 'project was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  def set_user_project
    @userproject = UserProject.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:title)

  end

  def user_project_params
params.require(:UserProject).permit(:user_type, :name)
  end
end
