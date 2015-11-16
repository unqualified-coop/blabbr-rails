require 'blabbr/version'
require 'blabbr/config'
require 'blabbr/request'
require 'blabbr/notification'

module Blabbr
  class << self
    attr_writer :config
  end

  def self.config
    @config ||= Config.new
  end

  def self.reset
    @config = Config.new
  end

  def self.configure
    yield config
  end
end
