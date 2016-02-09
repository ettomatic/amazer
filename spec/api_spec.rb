require 'spec_helper'
require 'rack/test'

include Rack::Test::Methods

def app
  Rack::Builder.parse_file('config.ru').first
end

describe '/maze/random' do
  it 'is ok' do
    get '/maze/random'
    expect(last_response).to be_ok
  end

  it 'can passed a size param' do
    get '/maze/random?size=6'
    expect(last_response).to be_ok
  end

  it 'can be passed a solution param' do
    get '/maze/random?solution=true'
    expect(last_response).to be_ok
  end
end

describe '/maze' do
  it 'redirects to /maze/random' do
    get '/maze?solution=true'
    expect(last_response.location).to eq 'http://example.org/maze/random'
  end
end

describe '/heartbeat' do
  it 'is ok' do
    get '/heartbeat'
    expect(last_response).to be_ok
  end
end
