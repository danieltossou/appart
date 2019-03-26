module ApplicationHelper

    def isAdmin?
        user_signed_in? && current_user.role == 'admin'
    end

    def total_note
        Notification.where(:vue => 0).count
    end

end
