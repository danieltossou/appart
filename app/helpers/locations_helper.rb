module LocationsHelper

    def etat
        etat_location = Location.find(params[:id])
        if etat_location.etat === true
            "Disponible"
        else
            "Occupé"
        end
    end
end
