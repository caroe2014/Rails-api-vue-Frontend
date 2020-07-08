class RefreshController < ApplicationController
    before_action :authorize_refresh_by_access_request!
    
    def create
        session = JWTSessions::Session.new(payload: payload, rehresh_by_access_allowed: true)
        tokens = session.refresh_by_access_allowed do
            raise JwtSessions::Errors::Unauthorized, "Something Not Right Here!"
        end
        response.set_cookie(JWTSessions.access_cookie,
                            valie: token[:access],
                            httponly: true,
                            secure: Rails.env.production? )

        render json: { csrf: token[:csrf] }         
    end    
end