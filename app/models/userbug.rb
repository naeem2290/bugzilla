class Userbug < ApplicationRecord
  belongs_to :user
  belongs_to :bug
end
