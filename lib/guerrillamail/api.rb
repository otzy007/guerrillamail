require 'rest-client'
require 'json'
require 'forwardable'

module Guerrillamail
  class API
    extend Forwardable
    attr_accessor :result

    def initialize(function, parameters = {}, cookies = {})
      parameters[:f] = function
      parameters[:ip] = '127.0.0.1'
      parameters[:agent] = 'guerrillamail_gem'

      @uri = "http://api.guerrillamail.com/ajax.php?#{URI.encode_www_form(parameters)}"
      @result = RestClient.get(@uri, cookies: cookies)
    end

    def body
      JSON.parse(@result.body)
    end

    delegate :cookies => :result
  end
end
