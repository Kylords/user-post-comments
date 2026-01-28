# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def current_user
    return @current_user if defined?(@current_user)

    header = request.headers['Authorization']
    token = header&.split(' ')&.last
    decoded = JsonWebToken.decode(token)

    @current_user = decoded ? User.find_by(id: decoded[:user_id]) : nil
  end
end
