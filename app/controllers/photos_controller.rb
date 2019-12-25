class PhotosController < ApplicationController
    def allphotos
        photos = Photo.where(user_id: params['user_id'])
        render json: photos
    end

    def upload
        response = Cloudinary::Uploader.upload(params['photo'], :cloud_name => 'pycasso', :api_key => '142377917961452', :api_secret => 'KejI49Hhzvw9wNlr3hV_Te8AeoM')
        photo = Photo.new(user_id: params['user']['id'], url: response['url'])
        photo.save

        user = User.find_by(id: params['user']['id'])
        user.profile_pic = response['url']
        if user.save
            render json: user
        end
    end

    def featured
        response = Cloudinary::Uploader.upload(params['photo'], :cloud_name => 'pycasso', :api_key => '142377917961452', :api_secret => 'KejI49Hhzvw9wNlr3hV_Te8AeoM')
        photo = Photo.new(user_id: params['user']['id'], url: response['url'])
        photo.save

        feature = params['feature']
        user = User.find_by(id: params['user']['id'])

        if feature == 'feature_one'
            user.feature_one = response['url']
        elsif feature == 'feature_two'
            user.feature_two = response['url']
        elsif feature == 'feature_three'
            user.feature_three = response['url']
        end

        if user.save
            render json: user
        end
    end

    def destroy
        photo = Photo.find_by(id: params['id'])
        id = photo.id
        if photo.destroy
            render json: params['id']
        else
            render json: { message: 'error' }
        end
    end
end
