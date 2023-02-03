class ReservationsController < ApplicationController
    def index
        @user = current_user
        @reservations = Reservation.all
    end
  
     #new_reservation GET    /reservations/new
    def new
        @user = current_user
        @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :room_id, :user_id, :total_price, :total_day))
        @room = Room.find(params[:reservation][:room_id])
    end
  
    def create
        @user = current_user
        @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :room_id, :user_id, :total_price, :total_day))
        if @reservation.save!
            flash[:notice] = "予約が完了しました"
            redirect_to reservations_path
        else
            flash[:alert] = "予約ができませんでした"
            render "rooms/show"
        end
    end
  
    def show #reservation GET    /reservations/:id
    end

    def edit #edit_reservation GET    /reservations/:id
        @rooms = Room.all
        @reservation = Reservation.find(params[:id])

    end

    def update
        @reservation = Reservation.find(params[:id])
          if @reservation = Reservation.update(params.require(:reservation).permit(:start_date, :end_date, :people, :room_id, :user_id, :total_price, :total_day))
              flash[:notice] = "情報を更新しました"
              redirect_to reservations_path
          else
              render "edit"
          end
    end


    def search #エリア検索、キーワード検索の双方の機能を設定する
        @user = current_user.id
        @q = Room.ransack(params[:q])
        @results = @q.result(distinct: true)
    end


    def destroy #DELETE /reservations/:id
       @reservation = Reservation.find(params[:id])
       @reservation.destroy
       flash[:notice] = "削除しました"
       redirect_to reservation_path
    end

    

end