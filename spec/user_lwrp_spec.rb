require 'spec_helper'

require 'json'
require 'net/http'


describe 'devpi_user' do
  let(:http_put)       { double('Put', :body= => true) }
  let(:http_requestor) { double('requestor', :request => true) }
  let(:http_response)  { double('response') }
  let(:http_instance)  { double('HTTP', :start => http_response) }

  before(:each) do
    Net::HTTP::Put.stub(:new).and_return http_put
    Net::HTTP.stub(:new).and_return http_instance
    http_instance.stub(:start).and_yield http_requestor
    JSON.stub(:generate).and_return :json_data

    chef_run = ChefSpec::Runner.new(step_into: ['devpi_user']) do |node|
      node.set['lwrp-tester']['user'] = 'devpi user'
    end
    chef_run.converge 'lwrp-tester::create-user'
  end

  it 'issues PUT to /<username>' do
    Net::HTTP::Put.should have_received(:new).with '/devpi user'
  end

  it 'includes generated JSON body' do
    http_put.should have_received(:body=).with :json_data
  end

  it 'sends the correct email property' do
    JSON.should have_received(:generate).
      with hash_including('email' => 'devpi user@somewhere.com')
  end

  it 'sends the password property' do
    JSON.should have_received(:generate).
      with hash_including('password' => 'password')
  end

  it 'connects to localhost:3141' do
    Net::HTTP.should have_received(:new).with('localhost', 3141)
  end

  it 'sends request to localhost:3141' do
    http_requestor.should have_received(:request).with(http_put)
  end

end
