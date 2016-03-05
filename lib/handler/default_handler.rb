module Handler
  class DefaultHandler < BaseHandler
    def consistent?
      sort_array_by_dict_ordinal
      return false if container.length < 2
      0.upto(container.length - 2) { |i| return false if container[i + 1].start_with?(container[i]) }
      true
    end

    private

    def build_array
      reader.each_line { |word| container << word.chomp }
    end

    def sort_array_by_dict_ordinal
      build_array
      container.map!(&:to_s).sort!
    end
  end
end
