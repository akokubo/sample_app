module SessionsHelper

  def sign_in(user)
    # 暗号化されていない記憶トークンの生成
    remember_token = User.new_remember_token
    # クッキーに暗号化されていない記憶トークンを保存
    # permanentは20年間保存する
    cookies.permanent[:remember_token] = remember_token
    # ユーザーの記憶トークンを暗号化してデータベースに保存
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    # セッションのインスタンス変数current_userにユーザーを保存
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    # @current_userがnilでなければ@current_user、nilなら記憶トークンで検索した結果
    @current_user ||= User.find_by(remember_token: remember_token)
  end
end
