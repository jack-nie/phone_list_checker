module Container
  class Trie
    attr_reader :root

    def initialize
      @root = {}
    end

    def build(word)
      node = @root
      word.each_char do |ch|
        return false if node[:end]
        node[ch] ||= {}
        node = node[ch]
      end
      return false if (0..9).any? { |i| !node[i.to_s].nil? }
      node[:end] = true
      true
    end
  end
end
