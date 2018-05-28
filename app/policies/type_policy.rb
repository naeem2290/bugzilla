class TypePolicy < ApplicationPolicy



def manager
  if user.present? && record.user_type == 'Manager'
    true
  end

end

def qa
  if user.present? && record.user_type == 'QA'
    true
  end

end

def developer
  if user.present? && record.user_type == 'Developer'
    true
  end

end


end
