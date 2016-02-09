require 'sinatra/base'

class Api < Sinatra::Base
  get '/maze/random' do
    size = params_size || 10
    maze = Amazer::Maze.new(size).build
    if show_exit_path?
      maze.solve
    end

    output = "<pre>\n"
    output << maze.display
    output << '</pre>'
  end

  get '/heartbeat' do
    'ok'
  end

  private

  def show_exit_path?
    params[:solution] && params[:solution] == 'true'
  end

  def params_size
    params[:size] && params[:size].to_i
  end
end
