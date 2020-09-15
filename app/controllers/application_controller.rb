class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def user
    render json: current_user.to_json
  end
end
