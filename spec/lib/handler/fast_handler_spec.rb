require_relative "../../spec_helper"

RSpec.describe FastHandler do
  describe "#consistant?" do
    context "the phone list includes a number which is another number's prefix" do
      let(:path) { File.join SPEC_ROOT, 'assets', '1_phone_list.txt' }
      let(:reader) { TxtReader.new path }
      subject { FastHandler.new reader, Trie.new }

      it "returns false wnen the phone list includes a number which is another number's prefix" do
        expect(subject.consistant?).to be_falsey
      end
    end

    context "the phone list dose'nt includes a number which is another number's prefix" do
      let(:path) { File.join SPEC_ROOT, 'assets', '2_phone_list.txt' }
      let(:reader) { TxtReader.new path }
      subject { FastHandler.new reader, Trie.new }

      it "returns true wnen the phone list dose'nt includes a number which is another number's prefix" do
        expect(subject.consistant?).to be_truthy
      end
    end
  end
end
