class Location < ApplicationRecord
  belongs_to :admin_user
  scope :published, -> { where(etat: true) }
  scope :unpublished, -> { where.not(etat: true) }
  paginates_per 10

  validates :duree, presence: { message: ': Vous devez choisir une durée' }
  validates :adresse, presence: { message: ': Vous devez renseigner l\'adresse' }
  # validates :images, presence: { message: ': Vous devez ajouter des images de l\'appartement' }
  validates :prix, presence: { message: ': Vous devez preciser le prix' }

  default_scope { order(created_at: :desc) }
  scope :dispo, -> { where(:etat => 1)}

  has_many :reservations
  has_many :images

  accepts_nested_attributes_for :images

	
end
