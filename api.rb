require 'sinatra/base'

class Api < Sinatra::Base
  get '/maze' do
    redirect '/maze/random', 301
  end

  get '/maze/random' do
    size = params_size || 10
    maze = Amazer::Maze.new(size).build
    if show_exit_path?
      maze.solve
    end

    @content = maze.display
    erb output
  end

  get '/heartbeat' do
    'ok'
  end

  private

  def output
<<-EOT
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>A random maze</title>
  </head>
  <body>
    <pre><%= @content %></pre>
  </body>
</html>
EOT
  end

  def show_exit_path?
    params[:solution] && params[:solution] == 'true'
  end

  def params_size
    params[:size] && params[:size].to_i
  end
end
