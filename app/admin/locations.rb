ActiveAdmin.register Location do
	permit_params :titre, :description, :adresse, :prix, :duree, :etat, :admin_user_id, images_attributes: [:id, :location, :titre]
	
	scope :all
	scope :published
	scope :unpublished

	  form do |f|
	    inputs 'Location - Detail' do
	      input :titre
	      input :description
	      hidden_field :etat, :value => :true
	      input :adresse
	      hidden_field :admin_user_id, :value => current_admin_user.id
	      
	      has_many :images, heading: 'Images' do |p|
	        p.file_field :titre, :multiple => true, name: "images[titre][]"
	      end
	      input :prix
	      select :duree, [['Prix par...', nil], 'jour', 'mois'], label: "Durée"
	    end
	    actions
	  end
	   	controller do
	   		after_create do	
    		    params[:images]['titre'].each do |a|
					@image = @location.images.create!(:titre => a)
				end
	    	end

	    	after_update do	
	    		@location.images.delete_all
	    		params[:images]['titre'].each do |a|
					@image = @location.images.create!(:titre => a)
				end
    		    
	    	end
	 	 end


	 	 show do
		    attributes_table do
		    	location location.images.each do |image|
		        	image_tag(image.titre_url, width: '10%') if image.titre.present?
			    end
		      	row :titre
		      	row :description
		      	row :adresse
		      	row :etat
		      	row :created_at
		      	row :updated_at
		      	row :prix
		      	row :duree
		      	
		    end
		    active_admin_comments
		end


	action_item :publish, only: :show do
		link_to "Publié", publish_admin_location_path(location), method: :put if !location.etat?
	end

	action_item :unpublish, only: :show do
		link_to "Masqué", unpublish_admin_location_path(location), method: :put if location.etat?
	end

	member_action :publish, method: :put do
		location = Location.find(params[:id])
		location.update(etat: true)
		redirect_to admin_location_path(location)
	end

	member_action :unpublish, method: :put do
		location = Location.find(params[:id])
		location.update(etat: false)
		redirect_to admin_location_path(location)
	end
end
