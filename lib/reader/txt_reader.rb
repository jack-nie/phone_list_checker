class TxtReader
  attr_accessor :path

  def initialize path
    @path = path
  end

  def each_line
    File.open(path, "rb") { |file| file.each_line { |line| yield line if block_given? } } if path
  end
end
