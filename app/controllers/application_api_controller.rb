class ApplicationAPIController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, Rails.application.secrets.jwt_secret_key)
    end

    def get_bearer_token
        header = request.headers['Authorization']
        if header
            header.split(" ")[1]
        end
    end

    def decoded_token
        if get_bearer_token
            begin
                JWT.decode(get_bearer_token, Rails.application.secrets.jwt_secret_key, true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def destroy_token
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
            @user.update(access_token: '');
            render json: { message: 'Logout is successfully!' }
        else
            render json: { error: 'Invalid token' }, status: :unauthorized
        end
    end

    def authorized
        if !get_bearer_token ||
            !current_user ||
            (current_user && get_bearer_token && current_user.access_token != get_bearer_token)
            render json: { message: 'Please log in' }, status: :unauthorized
        end
    end
end
