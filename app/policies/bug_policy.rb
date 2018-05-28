class BugPolicy < ApplicationPolicy



  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    if user.present? && user.user_type == 'qa'
      true
    end
  end

  def new?
    create?
  end




  def destroy?
    if user.present? && user.user_type == 'manager'
      true
    end
  end

  def developer_proj?
    if user.present? && user.user_type == 'developer'
      true
    end
  end

  def assign?
    if user.present? && user.user_type == 'developer'
      true
    end
  end

end
