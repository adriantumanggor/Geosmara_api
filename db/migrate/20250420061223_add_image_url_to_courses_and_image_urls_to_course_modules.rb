class AddImageUrlToCoursesAndImageUrlsToCourseModules < ActiveRecord::Migration[7.2]
  def change
    add_column :courses, :image_url, :string
    add_column :course_modules, :image_urls, :text
  end
end
