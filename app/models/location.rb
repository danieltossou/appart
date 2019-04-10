class Location < ApplicationRecord

  paginates_per 10

  validates :duree, presence: { message: ': Vous devez choisir une durée' }
  validates :adresse, presence: { message: ': Vous devez renseigner l\'adresse' }
  validates :images, presence: { message: ': Vous devez ajouter des images' }
  validates :prix, presence: { message: ': Vous devez preciser le prix' }

  default_scope { order(created_at: :desc) }
  scope :dispo, -> { where(:etat => 1)}

  has_many :reservations
  has_many :images, dependent: :delete_all

  accepts_nested_attributes_for :images

	
end
