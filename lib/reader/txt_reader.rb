module Reader
  class TxtReader
    attr_accessor :path

    def initialize(path)
      @path = path
    end

    def each_line
      open { |file| file.each_line { |line| yield line if block_given? } }
    end

    private

    def open
      File.open(path, 'rb') { |file| yield file } if path
    end
  end
end
