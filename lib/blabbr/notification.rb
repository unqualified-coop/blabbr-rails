module Blabbr
  class Notification
    attr_accessor :notification_type, :users, :message

    def initialize(params = {})
      @notification_type = params[:notification_type]
      @users = params[:user] ? [params[:user]] : params[:users]
      @message = params[:message]
    end

    def push!
      Blabbr::Request.new("notifications", {
        :notification => {
          :type => notification_type,
          :users => users,
          :message => message
        }}).post!
    end
  end
end
