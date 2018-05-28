class User < ApplicationRecord

has_many :projects, through: :user_projects

has_many :bugs, through: :userbugs

  # Include default devise modules. Others available are:ha
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
