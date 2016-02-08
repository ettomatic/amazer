require 'spec_helper'
require 'rack/test'

include Rack::Test::Methods

def app
  Rack::Builder.parse_file('config.ru').first
end

describe '/maze' do
  it 'is ok' do
    get '/maze'
    expect(last_response).to be_ok
  end

  it 'you can pass a size param' do
    get '/maze?size=6'
    expect(last_response).to be_ok
    puts last_response.body
  end
end

describe '/heartbeat' do
  it 'is ok' do
    get '/heartbeat'
    expect(last_response).to be_ok
  end
end
