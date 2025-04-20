class RemovePositionFromCourseModulesAndContents < ActiveRecord::Migration[7.2]
  def change
    remove_column :course_modules, :position, :integer
    remove_column :contents, :position, :integer
  end
end
