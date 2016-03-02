require_relative "../../spec_helper"

RSpec.describe TxtReader do
  describe '#each_line' do
    let(:path) { File.join(SPEC_ROOT, 'assets', '1_phone_list.txt') }
    let(:words) { File.readlines(path).map(&:chomp) }
    subject { TxtReader.new path }

    it 'yields every word yielded by the file' do
      yielded_words = []
      subject.each_line { |word| yielded_words << word.chomp }
      expect(yielded_words).to eq words
    end
  end
end
