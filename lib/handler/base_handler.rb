class BaseHandler
  attr_accessor :reader, :container

  def initialize reader, container = []
    @reader    = reader
    @container = container
  end

  def consistant?
    raise NotImplementedError, "subclass must implement method consistant?"
  end
end
