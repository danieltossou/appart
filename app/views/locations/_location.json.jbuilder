json.extract! location, :id, :titre, :description, :etat, :photo, :adresse, :prix, :user_id, :created_at, :updated_at
json.url location_url(location, format: :json)
