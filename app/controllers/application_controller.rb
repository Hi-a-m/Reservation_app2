class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  
  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
  end

  # #ログイン後の遷移先をトップページに、新規登録後の遷移先をプロフィール編集画面に設定する
  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました"
      root_path
    else
      flash[:notice] = "新規登録完了しました。"
      edit_user_registration_path
    end
  end

  #ログアウトした後のリダイレクト先をトップセージに設定する
  def after_sign_out_path_for(resource)
    root_path
  end

end      