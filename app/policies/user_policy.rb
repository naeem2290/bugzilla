class UserPolicy < ApplicationPolicy


  def manager?
    if user.present? && user.user_type == 'Manager'
      true
    end

  end

  def qa?
    if user.present? && user.user_type == 'QA'
      true
    end

  end

  def developer?
    if user.present? && user.user_type == 'Developer'
      true
    end

  end

end
