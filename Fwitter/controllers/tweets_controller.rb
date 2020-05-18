class TweetsController < ApplicationController
  get '/' do
    @tweets = Tweet.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/new'
    @tweet = Tweet.new(params)
    erb :show
  end


  get 'tweet/:id'
    @tweet = Tweet.find(params[:id])
    erb :show
  end

end
