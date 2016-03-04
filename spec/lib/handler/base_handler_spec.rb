require_relative '../../spec_helper'

RSpec.describe Handler::DefaultHandler do
  describe '#consistent?' do
    let(:path) { File.join SPEC_ROOT, 'assets', '1_phone_list.txt' }
    let(:reader) { Reader::TxtReader.new path }
    subject { Handler::BaseHandler.new reader }

    it 'should raise NotImplementedError when call consistent?' do
      expect { subject.consistent? }.to raise_error('subclass must implement method consistent?')
    end
  end
end
