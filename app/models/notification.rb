class Notification < ApplicationRecord
    belongs_to :user
    belongs_to :reservation

    default_scope { order(created_at: :desc) }
    scope :non_vue, -> { where(:vue => 0)}

end