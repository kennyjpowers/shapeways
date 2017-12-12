require "shapeways/version"

module Shapeways
  class Error < RuntimeError; end

  class << self
    attr_writer :callback_url
  end

  # Make Shapeways.api_key and Shapeways.api_secret global but also local to threads
  #
  def self.api_key
    Thread.current[:etsy_api_key] || @api_key
  end

  def self.api_key=(key)
    @api_key ||= key
    Thread.current[:etsy_api_key] = key
  end

  def self.api_secret
    Thread.current[:etsy_api_secret] || @api_secret
  end

  def self.api_secret=(secret)
    @api_secret ||= secret
    Thread.current[:etsy_api_secret] = secret
  end

  PRODUCTION_HOST = 'openapi.etsy.com'
end
