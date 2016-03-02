class BaseHandler
  attr_accessor :reader, :container

  def initialize reader, container = []
    @reader    = reader
    @container = container
  end

  def consistent?
    raise NotImplementedError, "subclass must implement method consistent?"
  end
end
