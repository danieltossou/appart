class ReservationsController < ApplicationController

    before_action :authenticate_user!, only: [:edit, :create, :destroy]

    authorize_resource

    def index
        @reservations = Reservation.all
    end

    def new
        @reservation = Reservation.new
    end

    def create
        @reservation = current_user.reservations.new(reservation_params)
        if @reservation.save
            redirect_to locations_path, notice: 'Reservation effectué avec succès'
        else
            format.html { render :new }
        end

    end

    def me
        @reservations = current_user.reservations
        render :index
    end
    

    private

    def reservation_params
        params.require(:reservation).permit(:date_debut_reservation, :date_fin_reservation, :nbre_personne, :location_id, :user_id)
    end
    
end
