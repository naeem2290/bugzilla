class Bug < ApplicationRecord

has_many :users, through: :userbugs

  belongs_to :project

  mount_uploader :screenshot, ScreenshotUploader
end
