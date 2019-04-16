class ReservationsController < ApplicationController

    before_action :set_reservation, only: [:show]
    before_action :authenticate_user!, only: [:edit, :create, :destroy, :me]
    load_and_authorize_resource

    def index
        @reservations = Reservation.all
    end

    def new
        @reservation = Reservation.new
    end

    def create
        @reservation = current_user.reservations.create(reservation_params)
        respond_to do |format|
            if @reservation.save
                format.html { redirect_to @reservation, notice: 'Veuillez confirmer votre reservation' }
            else
                format.html { redirect_to location_path(@reservation.location_id), notice: 'Reservation non effectuée' }
            end
        end

    end

    def me
        @reservations = current_user.reservations.includes(:location).alpha
        render :me
    end
    
    def show
        @images = @reservation.location.images.all
        Notification.where(reservation_id: params[:id]).update(:vue => true)
    end

    def destroy
        @location.images.delete
        @location.destroy
        respond_to do |format|
              format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
              format.json { head :no_content }
        end
    end
    

    private

    def set_reservation
        @reservation = Reservation.find(params[:id])
    end    

    def reservation_params
        params.require(:reservation).permit(:date_debut_reservation, :date_fin_reservation, :nbre_personne, :location_id, :user_id, :type_reservation)
    end
    
    
end
