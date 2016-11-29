$:.unshift File.dirname(__FILE__)
require 'config/boot'

class SecretMessages < Sinatra::Base
  enable :sessions

  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

  set :root, File.dirname(__FILE__)
  set :erb, layout: :'layouts/application'

  get '/' do
    erb :new
  end

  post '/messages' do
    @message = Message.new(params[:message])
    if @message.save
      flash[:info] = "Message was successfully created!"
      redirect to "/messages/preview/#{@message.uid}"
    else
      flash[:error] = @message.errors.full_messages.join(', ')
      redirect to "/"
    end
  end

  get '/messages/preview/:uid' do
    @message = Message.find_by(uid: params[:uid])
    halt(404, erb(:error)) if @message.nil?

    erb :preview
  end

  get "/messages/:uid" do
    @message = Message.find_by(uid: params[:uid])
    halt(404, erb(:error)) if @message.nil?

    if @message.destroy_immediately
      @message.destroy
    else
      MessageDestroyWorker.perform_in(1.hour, @message.id)
    end

    erb :show
  end
end
