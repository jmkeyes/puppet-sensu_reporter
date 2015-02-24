require 'puppet'

processor = Puppet::Reports.report(:sensu)

describe processor do
  subject { Puppet::Transaction::Report.new('apply').extend(processor) }

  describe "#process" do
    it 'should respond to #process' do
      expect(subject).to respond_to(:process)
    end
  end
end
