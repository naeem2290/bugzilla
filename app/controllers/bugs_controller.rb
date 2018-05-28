class BugsController < ApplicationController

  def new
    @bug = Bug.new
  end

  def index

  end

  def create
    @bug = Bug.new(bug_params.merge(project_id: params[:project_id]))
    @bug.screenshot.url # => '/url/to/file.png'
    @bug.screenshot.current_path # => 'path/to/file.png'
    @bug.screenshot.identifier # => 'file.png'

    respond_to do |format|
      if @bug.save!
        format.html { redirect_to qa_path, notice: 'Bug was successfully created.' }
      else
        format.html { render :new, notice: "Bug was not created" }
      end
    end
  end


def show


end


def assigned

  b=Bug.where(id: params[:format])

  b.each do |proj|

    p=Project.where(id: proj.project_id)

      p.each do |user|
          u = User.where(id: user.user_id)

          u.each do |userbug|
            @bug = Userbug.create(bug_id: proj.id, user_id: userbug.id)
          if @bug.present? && proj.status!='Started'
            b =Bug.where(id: params[:format]).update(status: "Started").first
            flash[:alert] = 'Bug is asssigned successfully'
            redirect_to developer_path
          else
            flash[:alert] = 'Bug is already assigned'
            redirect_to developer_path

          end
        end
      end
    end
end


def destroy
  u = Bug.find(params[:id])
  Userbug.where(bug_id: params[:id]).destroy_all
  u.destroy
  respond_to do |format|
    format.html { redirect_to qa_path, notice: 'Bug was successfully destroyed.' }
  end
end


def assign
  @bugs = Bug.where(project_id: params[:id])
end





def resolve
  b=Bug.find(params[:format])

  if b.status!="Resolved" && b!=" "
    b =Bug.where(id: params[:format]).update(status: "Resolved").first
    flash[:alert] = 'Bug is marked resolved'
    redirect_to developer_path
  else
    flash[:alert] = 'Bug is already resolved'
    redirect_to developer_path
  end
end



def developer_proj
  @userproject = UserProject.where(user_id: params[:format])
  @userproject.each do |dev|
    if dev!=" "
      @developer = Project.where(id: dev.project_id)
      @developer.each do |bug|
        if(bug!=" ")
          @bug = Bug.where(project_id: bug.id)
        end
      end
    end
  end
end

private

  def set_bug
      @bug = Bug.find(params[:project_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def bug_params
    params.require(:bug).permit(:title, :screenshot, :bug_type, :status)
  end

end
