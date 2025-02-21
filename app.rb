require "sinatra"
require "./lib/counter"
require './database_connection_setup'

class CounterApp < Sinatra::Base

  before do
    @counter = Counter.instance
  end

  get '/' do
    erb :index
  end

  post '/increment' do
    @counter.increment
    @counter.update_time
    redirect '/'
  end

  post '/decrement' do
    @counter.decrement
    @counter.update_time
    redirect '/'
  end

end
