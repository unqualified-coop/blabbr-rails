module Blabbr
  class Notification
    attr_accessor :access_token, :notification_type, :users, :message

    def initialize(params = {})
      @access_token = params[:access_token]
      @notification_type = params[:notification_type]
      @users = params[:user] ? [params[:user]] : params[:users]
      @message = params[:message]
    end

    def push!
      Blabbr::Request.new("notifications", {
        :access_token => access_token,
        :notification => {
          :type => notification_type,
          :users => users,
          :message => message
        }
      }).post!
    end
  end
end
