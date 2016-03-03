require_relative "../spec_helper"

RSpec.describe PhoneListChecker do
  describe "#consistent?" do
    let(:path) { File.join SPEC_ROOT, 'assets', '1_phone_list.txt' }
    let(:reader) { TxtReader.new path }
    let(:handler) { DefaultHandler.new reader }
    subject { PhoneListChecker.new handler }

    context "the phone list includes a number which is another number's prefix" do
      it "should be false when use DefaultHandler" do
        expect(subject.consistent?).to be_falsey
      end

      it "should be false when use FastHandler" do
        subject.handler = FastHandler.new reader, Trie.new
        expect(subject.consistent?).to be_falsey
      end
    end

    context "the phone list dose'nt includes a number which is another number's prefix" do
      it "returns true when the phone list dose'nt includes a number which is another number's prefix" do
        reader.path = File.join SPEC_ROOT, 'assets', '2_phone_list.txt'
        expect(subject.consistent?).to be_truthy
      end

      it "should be true when use DefaultHandler" do
        reader.path = File.join SPEC_ROOT, 'assets', '2_phone_list.txt'
        subject.handler = FastHandler.new reader, Trie.new
        expect(subject.consistent?).to be_truthy
      end
    end
  end
end
