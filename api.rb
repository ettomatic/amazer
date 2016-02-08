require 'sinatra/base'

class Api < Sinatra::Base
  get '/maze' do
    size = params_size || 10
    out = Amazer::Maze.new(size).build
    s = "<pre>\n"
    s << out.display
    s << '</pre>'
  end

  get '/heartbeat' do
    'ok'
  end

  private

  def params_size
    params[:size] && params[:size].to_i
  end
end
