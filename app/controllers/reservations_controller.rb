class ReservationsController < ApplicationController

    def new
        @location = Location.find(params[:id_appart])
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
            redirect_to locations_path, notice: 'Reservation effectué avec succès'
        else
            render :new
        end

    end

    private

    def reservation_params
        params.require(:reservation).permit(:nom, :prenom, :date_debut_reservation, :date_fin_reservation, :nbre_personne, :location_id)
    end
    
end
