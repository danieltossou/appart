class Reservation < ApplicationRecord

        
    belongs_to :user

    belongs_to :location

    after_commit :notification_create, on: :create

    def notification_create

        Notification.create(
            user_id: user_id,
            notify_type: 'Reservation',
            reservation_id: Reservation.last.id,
            vue: false
        )

    end

    scope :alpha, -> { order(id: :desc) }

end
