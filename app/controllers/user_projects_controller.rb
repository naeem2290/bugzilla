class UserProjectsController < ApplicationController
  before_action :set_user_project, only: [:show, :edit, :update, :destroy]

  def index
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end


  def delete
    @userproject= UserProject.where(project_id: params[:id])
  end

  def new
    @userproject = UserProject.new
  end

  def edit
  end

  def create
    @userproject = UserProject.new(user_project_params.merge(user_id: current_user.id, project_id: params[:project_id]))
    @userproject.save
    respond_to do |format|
      if @userproject.save
        format.html { redirect_to manager_path, notice: 'Developer was successfully created.' }

      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @userproject.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Developer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_project
      @userproject = UserProject.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def user_project_params
      params.require(:userproject).permit(:name,:user_type)
    end
end
