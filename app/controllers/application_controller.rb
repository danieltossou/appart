class ApplicationController < ActionController::Base

    rescue_from CanCan::AccessDenied do |exception|

        redirect_to location_path, notice: 'Accès interdit'

    end


end
