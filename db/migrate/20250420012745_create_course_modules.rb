class CreateCourseModules < ActiveRecord::Migration[7.2]
  def change
    create_table :course_modules do |t|
      t.references :course, null: false, foreign_key: true
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
