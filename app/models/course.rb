class Course < ApplicationRecord
    has_many :course_modules, -> { order(:position) }, dependent: :destroy
  end
  