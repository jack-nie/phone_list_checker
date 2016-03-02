require "forwardable"

require_relative "reader/txt_reader"
require_relative "handler/base_handler"
require_relative "handler/default_handler"

class PhoneListChecker
  extend Forwardable

  attr_accessor :handler

  def initialize handler
    @handler = handler
  end

  delegate :consistant? => :@handler
end
