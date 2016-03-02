require_relative "../../spec_helper"

RSpec.describe DefaultHandler do
  describe "#consistant?" do
    let(:path) { File.join SPEC_ROOT, 'assets', '1_phone_list.txt' }
    let(:reader) { TxtReader.new path }
    subject { DefaultHandler.new reader }

    it "returns false wnen the phone lsit includes a number which is anothr number's prefix" do
      expect(subject.consistant?).to be_falsey
    end
  end
end
