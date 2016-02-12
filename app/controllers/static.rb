require 'sinatra'
require 'sinatra/flash'
require 'time'
require 'date'
enable :sessions

get '/' do
  @urls =  Url.all
  @error = flash[:error_messages]#params[:error]
  
  flash[:date] = Time.now.strftime("%A , %d %B %Y") #http://ruby-doc.org/core-1.8.7/Time.html#method-i-strftime
  flash[:time] = Time.now.strftime("%I: %M: %S")
  erb :"static/index"#, :layout => :'layout'
end

post '/create' do 
  @urls = Url.all
  @url  = Url.new(long_url_text: params[:long_url])
  @url.shorten 
  

  if @url.save
    # erb :"static/success"
    @url.to_json
  else
    flash[:error_messages] = @url.errors.full_messages
    @error_message = @url.errors.full_messages
    redirect "/?error=#{@error_message}"
  end
end


get '/faq' do
  @urls =  Url.all
  erb :"static/faq"
end

get '/url_list' do
  @urls =  Url.all
  erb :"static/success"
end

get '/:short_url' do 
  @url = Url.find_by(short_url_text: params[:short_url])
  @url.click_count+=1
  @url.save
  redirect "#{@url.long_url_text}"
end