module Api
  class CoursesController < ApplicationController
    protect_from_forgery with: :null_session

    # Endpoint untuk mendapatkan daftar kursus
    def index
      courses = Course.all.order(:id).map do |course|
        {
          id: course.id,
          title: course.title,
          image_url: url_for_image(course.image_url),
          finished: course.finished,
          modules: course.course_modules.map do |mod|
            {
              id: mod.id,
              title: mod.title,
              image_urls: map_image_urls(mod.image_urls),
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
      render json: courses
    end

    
    # Endpoint untuk mendapatkan detail kursus berdasarkan ID
    def show
      course = Course.includes(course_modules: :contents).find(params[:id])

      render json: {
        id: course.id,
        title: course.title,
        image_url: url_for_image(course.image_url),
        finished: course.finished,
        modules: course.course_modules.map do |mod|
          {
            id: mod.id,
            title: mod.title,
            image_urls: map_image_urls(mod.image_urls), # Gunakan fungsi helper
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

    def update
      course = Course.find(params[:id])
      
      if course.update(course_params)
        render json: { 
          id: course.id,
          finished: course.finished,
          message: 'Course status updated successfully'
        }, status: :ok
      else
        render json: { 
          errors: course.errors.full_messages 
        }, status: :unprocessable_entity
      end
    end
    
    private
    
    def course_params
      params.require(:course).permit(:finished)
    end

    # Fungsi untuk mengonversi path relatif ke URL absolut
    def url_for_image(path)
      Rails.logger.debug "Base URL: #{request.base_url}"
      return nil if path.blank?
    
      # Ganti 'localhost' dengan '10.0.2.2' pada base_url
      modified_base_url = request.base_url.sub('localhost', 'localhost')
    
      # Pastikan tidak ada garis miring ganda pada path
      relative_path = "/#{path.sub(/^\//, '')}"
    
      # Gabungkan base URL yang telah dimodifikasi dengan relative path
      URI.join(modified_base_url, relative_path).to_s
    end

    def map_image_urls(image_urls)
      Rails.logger.debug "Raw Image URLs: #{image_urls.inspect}"
    
      parsed_urls = if image_urls.is_a?(String)
                      begin
                        JSON.parse(image_urls)
                      rescue JSON::ParserError
                        []
                      end
                    else
                      Array(image_urls)
                    end
    
      processed_urls = Array(parsed_urls).reject(&:blank?).map do |path|
        url_for_image(path)
      end
    
      Rails.logger.debug "Parsed Image URLs: #{parsed_urls.inspect}"
      Rails.logger.debug "Processed Image URLs: #{processed_urls.inspect}"
      processed_urls
    end
    
  end
end