class HomeController < ApplicationController


def index
  if current_user.present?
    @user_typ=current_user.user_type
  end
  if current_user.user_type=="Manager"
    manager_view
  elsif current_user.user_type=="Developer"
    developer_view
  elsif current_user.user_type=="QA"
    qa_view
  end
end


  def manager_view
    redirect_to manager_path
  end

  def developer_view
    redirect_to developer_path
  end

  def qa_view
    redirect_to qa_path
  end
end
