require 'net/http'
require 'guerrillamail/api'

class GuerrillaMail
  extend Forwardable

  attr_accessor :cookies, :body

  def initialize(email_user = nil)
    if email_user
      with_email_user(email_user)
    else
      random_email
    end
  end

  def with_email_user(email_user)
    request = Guerrillamail::API.new('set_email_user', email_user: email_user)
    @cookies = request.cookies
    @body = request.body
  end

  def random_email
    request = Guerrillamail::API.new('get_email_address')
    @cookies = request.cookies
    @body = request.body
  end

  def check_email(seq = 0)
    JSON.parse(Guerrillamail::API.new('check_email', {seq: seq}, @cookies).result.body)
  end

  delegate :[] => :body
end
