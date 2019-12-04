class PhotosController < ApplicationController
    def allphotos
        photos = Photo.where(user_id: params['user_id'])
        render json: photos
    end

    def upload
        response = Cloudinary::Uploader.upload(params['photo'], :cloud_name => 'pycasso', :api_key => '142377917961452', :api_secret => 'KejI49Hhzvw9wNlr3hV_Te8AeoM')
        photo = Photo.new(user_id: params['user']['id'], url: response=['url'])
        photo.save

        user = User.find_by(id: params['user']['id'])
        user.profile_pic = response['url']
        if user.save
            render json: user
        end
    end

    def featured
        byebug
    end
end
