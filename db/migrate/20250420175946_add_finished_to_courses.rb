class AddFinishedToCourses < ActiveRecord::Migration[7.2]
  def change
    add_column :courses, :finished, :boolean, default: false, null: false
  end
end