class ApplicationController < ActionController::Base
    def current_user
        @users = User.find_by(id: 1)
    end
end
