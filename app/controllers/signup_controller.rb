class SignupController < ApplicationController
  def create
    @user = User.new(usr_params)

    if @user.save
      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload, rehresh_by_access_allowed: true)
      tokens = session.login

      response.set_cookie(JWTSessions.access_cookie,
                          valie: token[:access],
                          httponly: true,
                          secure: Rails.env.production? )
      render json: { csrf: token[:csrf] }                    
    else
      render json: { error: user.errors.full.messages.join(' '), status: :not_authorized }   
    end
    
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
