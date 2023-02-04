class HomesController < ApplicationController
    before_action :set_q, only: [:index, :search]

    def top
        @user = current_user
        @rooms = Room.all
        @q = Room.ransack(params[:q]) #検索フォームの条件、入力した値(params[:q])を元に、roomsテーブルからデータを検索します。
        

    end

    def index
        @user = current_user
        @all_rooms = Room.all
        #検索オブジェクト
        @q = Room.ransack(params[:q]) #params[:q]には検索パラメータが渡され、resultにより検索結果を得られる。
        #検索オブジェクト
        @results = @q.result
        @rooms = Room.search(params[:keyword])
    end

    def new
    end

    def create
    end

    def search
        @results = @q.result #ransack用
        @user = current_user
    end

    private
    
    def set_q
      @q = Room.ransack(params[:q]) 
    end
  
end

#params[:q]	この後に作成するビューファイルから送られてくるパラメーターです。
#ransackメソッド	送られてきたパラメーターを元にテーブルからデータを検索するメソッドです。(whereメソッドのransack版というイメージです。)
#resultメソッド	ransackメソッドで取得したデータをActiveRecord_Relationのオブジェクトに変換するメソッドです。