module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # recreate the current user inorder to let socket knows who is the current user
    identified_by :current_user

    def guest_user
      guest = GuestUser.new
      guest.id = guest.object_id # object in memory, very fast
      guest.name = "Guest User"
      guest.first_name = "Guest"
      guest.last_name = "User"
      guest.email = "guest@user.com"
      guest
    end

    def connect
      self.current_user = find_verified_user || guest_user
      logger.add_tags 'ActionCable', current_user.email
      logger.add_tags 'ActionCable', current_user.id
    end

    def find_verified_user
      if verified_user = env['warden'].user
        verified_user
      end
    end
  end
end
