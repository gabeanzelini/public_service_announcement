module PublicSeriviceAnnouncement
  class AccessDenied < StandardError

    def initialize(message = "You are not authorized to access this page.")
      @message = message
    end
    
    def to_s
      @message
    end
 end
end