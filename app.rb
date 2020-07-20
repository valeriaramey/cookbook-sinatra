require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative "cookbook"

set :bind, '0.0.0.0'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

# routing = homepage. This is my index
get '/' do
  cookbook = Cookbook.new("./recipes.csv")
  @recipes = cookbook.all
  erb :index
end
