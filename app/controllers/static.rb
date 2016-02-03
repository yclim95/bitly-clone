get '/' do
  @urls =  Url.all
  @error = params[:error]
  erb :"static/index"#, :layout => :'layout'
end

post '/urls' do 
  @urls =  Url.all
  @long_url = Url.new(long_url_text: params[:long_url])
  @long_url.shorten 
  @error_message = "The link you provided is invalid !"
  if @long_url.save
    erb :"static/success"
  else
    redirect "/?error=#{@long_url.errors.full_messages}"
  end
end

 # get '/success' do

 # end

# get './name ' do

# end	

get '/:short_url' do 
  @url = Url.find_by(short_url_text: params[:short_url])
  @url.click_count+=1
  @url.save
  redirect "#{@url.long_url_text}"
end