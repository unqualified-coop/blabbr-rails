module Blabbr
  class Config
    attr_accessor :client_id
    attr_accessor :client_secret
    attr_accessor :host
    attr_accessor :auth_token

    def initialize
      @host = "http://blabbr-dashboard.herokuapp.com"
    end
  end
end
