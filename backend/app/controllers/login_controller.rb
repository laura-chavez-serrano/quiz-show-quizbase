class LoginController < ApplicationController
include ActionController::HttpAuthentication::Basic::ControllerMethods


    def index
        authenticate_or_request_with_http_basic do |username, password|

            user = User.find_by_username(usersname)

            if user && user.authenticate(password) then
                render :json =>
                :status => :ok,
                :id => user.id,
                :admin => user.admin,
                :name => user.name,
                :token => user.token
                :joined => user.create_at

            else
                render :json =>(
                :status => :unauthorized,
                :message => "unauthorized"
                )
                
            end
        end

    
    end
end
