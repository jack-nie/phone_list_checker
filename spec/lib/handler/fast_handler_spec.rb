require_relative "../../spec_helper"

RSpec.describe FastHandler do
  describe "#consistent?" do
    let(:path) { File.join SPEC_ROOT, 'assets', '1_phone_list.txt' }
    let(:reader) { TxtReader.new path }
    subject { FastHandler.new reader, Trie.new }

    it "returns false when the phone list includes a number which is another number's prefix" do
      expect(subject.consistent?).to be_falsey
    end

    it "returns true when the phone list dose'nt includes a number which is another number's prefix" do
      reader.path = File.join SPEC_ROOT, 'assets', '2_phone_list.txt'
      expect(subject.consistent?).to be_truthy
    end
  end
end
