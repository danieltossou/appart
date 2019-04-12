class ReservationsController < ApplicationController

    before_action :set_reservation, only: [:show, :confirmation, :contrat]
    before_action :authenticate_user!, only: [:edit, :create, :destroy, :me]

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
            redirect_to confirmation_reservations_path(@reservation), notice: 'Veuillez confirmer votre reservation'
        else
            format.html { render :new }
        end

    end

    def me
        @reservations = current_user.reservations.includes(:location).alpha
        render :index
    end
    
    def show    
        Notification.where(reservation_id: params[:id]).update(:vue => true)
    end

    def confirmation
    end

    def contrat
        respond_to do |format|
            format.pdf { render template: 'reservations/contrat', pdf: 'Contrat' }
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
