class UsersController < ApplicationController
  protect_from_forgery
#ユーザープロフィールのために、deviseと別でUsersコントローラーを作成

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    # 編集するユーザーが本人じゃない場合はユーザーページにリダイレクトする
    # これをしないと、ログインさえしていれば、"/users/5/edit"みたいな適当なurlにアクセスすると、他の人のプロフィール編集画面を表示できてしまう
    unless @user == current_user
    end
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update!(user_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to user_path
    else
      flash.now[:alert] = "プロフィールを更新できませんでした"
      render :edit
    end
  end

  private

    def set_user
      @user = User.find([:id])
    end

    def user_params
      params.require(:user).permit(:name, :icon, :profile) #変更後
    end
    
end