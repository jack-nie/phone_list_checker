require_relative "../../spec_helper"

RSpec.describe DefaultHandler do
  describe "#consistant?" do
    let(:path) { File.join SPEC_ROOT, 'assets', '1_phone_list.txt' }
    let(:reader) { TxtReader.new path }
    subject { BaseHandler.new reader }

    it "should raise NotImplementedError when call consistant?" do
      expect { subject.consistant? }.to raise_error("subclass must implement method consistant?")
    end
  end
end
