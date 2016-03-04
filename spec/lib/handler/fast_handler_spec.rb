require_relative '../../spec_helper'

RSpec.describe Handler::FastHandler do
  describe '#consistent?' do
    let(:path) { File.join SPEC_ROOT, 'assets', '1_phone_list.txt' }
    let(:reader) { Reader::TxtReader.new path }
    subject { Handler::FastHandler.new reader, Container::Trie.new }

    it "returns false phone numbers includes another number's prefix" do
      expect(subject.consistent?).to be_falsey
    end

    it "returns true phone numbers dose'nt includes another number's prefix" do
      reader.path = File.join SPEC_ROOT, 'assets', '2_phone_list.txt'
      expect(subject.consistent?).to be_truthy
    end
  end
end
