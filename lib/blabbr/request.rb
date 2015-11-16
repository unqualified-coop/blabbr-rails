require 'faraday'
require 'json'
require 'base64'

module Blabbr
  class Request
    attr_accessor :path, :data
    attr_reader :headers

    def initialize(path = "", params = {})
      @path = path
      @data = params
      @token = Blabbr.config.auth_token || request_auth_token

      @headers = {
        'Accept' => 'application/vnd.blabbr.com;version=1',
        'Authorization' => "Bearer #{@token}"
      }
    end

    def get!
      request(:get, path, data).data
    end

    def post!
      response = request(:post, path, data)
      JSON.parse(response.body)
    end

    def put!
      response = request(:put, path, data)
      JSON.parse(response.body)
    end

    def delete!
      response = request(:delete, path, data)
      JSON.parse(response.body)
    end

    private

    def api_url(path)
      "#{Blabbr.config.host}/api/#{path}"
    end

    def request(method, path, params, success_status = 200)
      conn = Faraday.new
      conn.headers = headers

      response = conn.send(method, api_url(path), params)
    end

    def request_auth_token
      basic = Base64.strict_encode64("#{Blabbr.config.client_id}:#{Blabbr.config.client_secret}")

      conn = Faraday.new
      conn.headers = { 'Authorization' => "Basic #{basic}" }

      response = conn.post("#{Blabbr.config.host}/oauth/token", {grant_type: "client_credentials"})

      Blabbr.config.auth_token = JSON.parse(response.body)["access_token"]
    end
  end
end

# post "/api/notifications", .to_json, {
#   'Content-Type' => "application/json",
#   'Accept' => 'application/vnd.blabbr.com;version=1'}
