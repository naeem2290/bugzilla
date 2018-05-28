class ProjectPolicy < ApplicationPolicy

  def index?
    user.present?
  end

  def show?
    is_user_project=UserProject.where(user_id: user.id, project_id: record.id).present?
        if user.present? && is_user_project
          true
        end
  end


  def create?
        if user.present? && user.user_type == 'manager'
          true
        end
  end

  def new?
        if user.present? && user.user_type == 'manager'
          true
        end
  end

  def display?
        if user.present? && user.user_type == 'manager'
          true
        end
  end


  def delete_member?
        if user.present? && user.user_type == 'manager'
          true
        end
  end

  def remove_member?
        if user.present? && user.user_type == 'manager'
          true
        end
  end

  def update?
        if user.present? && user.user_type == 'manager'
          true
        end
  end

  def destroy?
        if user.present? && user.user_type == 'manager'
          true
        end
  end

end
