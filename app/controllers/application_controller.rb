class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Sessionヘルパーの読み込み
  # ヘルパーはビューに自動的に読み込まれるが、コントローラーでは明示的に読み込む必要がある
  include SessionsHelper
end
