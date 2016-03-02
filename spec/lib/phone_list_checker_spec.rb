require_relative "../spec_helper"

RSpec.describe PhoneListChecker do
  describe "when a file path is provided" do
    let(:path) { File.join SPEC_ROOT, 'assets', '1_phone_list.txt' }
    let(:reader) { TxtReader.new path }
    let(:handler) { DefaultHandler.new reader }
    subject { PhoneListChecker.new handler }

    it "returns false wnen the phone lsit includes a number which is anothr number's prefix" do
      expect(subject.consistant?).to be_falsey
    end
  end
end
