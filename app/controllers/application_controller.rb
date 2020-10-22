class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user! # ログイン画面へ遷移させる
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # ユーザー認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  # nameカラムの保存を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
