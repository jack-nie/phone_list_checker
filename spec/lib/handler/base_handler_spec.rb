require_relative "../../spec_helper"

RSpec.describe DefaultHandler do
  describe "#consistent?" do
    let(:path) { File.join SPEC_ROOT, 'assets', '1_phone_list.txt' }
    let(:reader) { TxtReader.new path }
    subject { BaseHandler.new reader }

    it "should raise NotImplementedError when call consistent?" do
      expect { subject.consistent? }.to raise_error("subclass must implement method consistent?")
    end
  end
end
