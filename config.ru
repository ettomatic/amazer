$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require 'amazer'
require_relative 'api'
run Api.new
