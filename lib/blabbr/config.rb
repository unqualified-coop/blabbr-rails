module Blabbr
  class Config
    attr_accessor :client_id
    attr_accessor :client_secret
    attr_accessor :host
    attr_accessor :auth_token

    def initialize
      @host = "http://10.13.105.27:3005"
    end
  end
end
