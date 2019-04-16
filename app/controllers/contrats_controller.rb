class ContratsController < ApplicationController

    before_action :set_reservation, only: [:show, :contrat, :confirmation]
    load_and_authorize_resource
    
  def index
  	@contrats = Contrat.all
  end

  def create
    @contrat = current_user.contrats.new(contrat_params)
    respond_to do |format|
      if @contrat.save
        format.html { redirect_to @contrat }
      end
    end
  end

  def show
    respond_to do |format|
        format.pdf { render template: 'contrats/show', pdf: 'Contrat' }
    end
  end

  def me
  	@contrats = current_user.contrats
  end

    def confirmation
      @contrat = Contrat.new
    end

    def set_reservation
        @reservation = Reservation.find(params[:id])
    end

    def contrat_params
      params.require(:contrat).permit(:reservation_id)
    end

end
