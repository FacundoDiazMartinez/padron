require_relative "padron/version"
require_relative "padron/call"
require_relative "padron/auth_data"
require_relative "padron/constants"
require_relative "padron/wsaa"
require_relative "padron/id_persona"
require 'rails'
require "savon"
require 'net/http'
require 'net/https'


module Padron
  class Error < StandardError; end

  mattr_accessor :cuit, :pkey, :cert, :environment, :openssl_bin
  
  def self.root
    File.expand_path '../..', __FILE__
  end

  def deleteToken
      AuthData.deleteToken
  end

  def self.auth_hash(service = "ws_sr_padron_a5")
    { 'token' => Padron::TOKEN, 'sign'  => Padron::SIGN, 'cuitRepresentada'  => Padron.cuit }
  end

  def self.setup(&block)
    yield self
  end

end





