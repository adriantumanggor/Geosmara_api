class CourseModule < ApplicationRecord
  belongs_to :course
  has_many :contents, -> { order(:position) }, dependent: :destroy
end
