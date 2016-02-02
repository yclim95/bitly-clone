get '/' do
  @urls =  Url.all
  erb :"static/index"
end

post '/urls' do 
  @urls =  Url.all
  url = Url.new(long_url_text: params[:long_url])
  url.shorten 
  erb :"static/success"
end

 # get '/success' do

 # end

# get './name ' do

# end	

get '/:short_url' do 
  @url = Url.find_by(short_url_text: params[:short_url])

  redirect "http://#{@url.long_url_text}"
end