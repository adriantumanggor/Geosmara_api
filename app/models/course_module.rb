class CourseModule < ApplicationRecord
  belongs_to :course
  has_many :contents, dependent: :destroy
end
