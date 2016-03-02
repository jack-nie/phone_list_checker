class FastHandler < BaseHandler
  def consistant?
    build_trie
  end

  private
  def build_trie
    reader.each_line do |word|
      return false unless container.build(word.chomp)
    end
    true
  end
end
