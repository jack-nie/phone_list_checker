require_relative '../spec_helper'

RSpec.describe PhoneListChecker do
  describe '#consistent?' do
    let(:path) { File.join SPEC_ROOT, 'assets', '1_phone_list.txt' }
    let(:reader) { Reader::TxtReader.new path }
    let(:handler) { Handler::DefaultHandler.new reader }
    subject { PhoneListChecker.new handler }

    context "the phone numbers includes another number's prefix" do
      it 'should be false when use DefaultHandler' do
        expect(subject.consistent?).to be_falsey
      end

      it 'should be false when use FastHandler' do
        subject.handler = Handler::FastHandler.new reader, Container::Trie.new
        expect(subject.consistent?).to be_falsey
      end
    end

    context "the phone numbers dose'nt includes another number's prefix" do
      it 'should be true when use DefaultHandler' do
        reader.path = File.join SPEC_ROOT, 'assets', '2_phone_list.txt'
        expect(subject.consistent?).to be_truthy
      end

      it 'should be true when use FastHandler' do
        reader.path = File.join SPEC_ROOT, 'assets', '2_phone_list.txt'
        subject.handler = Handler::FastHandler.new reader, Container::Trie.new
        expect(subject.consistent?).to be_truthy
      end
    end
  end
end
