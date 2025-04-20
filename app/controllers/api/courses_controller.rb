module Api
  class CoursesController < ApplicationController
    def index
      courses = Course.all
      render json: courses.as_json(only: [:id, :title])
    end

    def show
      course = Course.includes(course_modules: :contents).find(params[:id])
    
      render json: {
        id: course.id,
        title: course.title,
        modules: course.course_modules.map do |mod|
          {
            id: mod.id,
            title: mod.title,
            contents: mod.contents.map do |content|
              {
                id: content.id,
                text: content.text
              }
            end
          }
        end
      }
    end    
  end
end
