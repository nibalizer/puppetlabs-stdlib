require 'spec_helper'

describe 'load_module_metadata' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params().and_raise_error(Puppet::ParseError, /wrong number of arguments/i) }
  it { is_expected.to run.with_params("one", "two").and_raise_error(Puppet::ParseError, /wrong number of arguments/i) }

  it "should json parse the file" do
     allow(File).to receive(:read).with(/metadata.json/) { "{\"name\": \"spencer-science\"}" }

     result = subject.call('science')
     expect(result).to eq('spencer-science')
end
