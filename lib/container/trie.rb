class Trie
  attr_reader :root

  def initialize
    @root = {}
  end

  def build str
    node = @root
    str.each_char do |ch|
      return false if node[:end]
      node[ch] ||= Hash.new
      node = node[ch]
    end
    if (0..9).any? { |i| !node["#{i.to_s}"].nil? }
      return false
    else
      node[:end] = true
    end
    true
  end
end
