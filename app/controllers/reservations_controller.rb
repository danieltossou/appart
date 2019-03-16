class ReservationsController < ApplicationController

    before_action :authenticate_user!, only: [:edit, :create, :destroy]

    def new
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
            redirect_to locations_path, notice: 'Reservation effectué avec succès'
        else
            format.html { render :new }
        end

    end

    private

    def reservation_params
        params.require(:reservation).permit(:date_debut_reservation, :date_fin_reservation, :nbre_personne, :location_id, :user_id)
    end
    
end
