get '/' do
  erb :"search"
end

post '/results' do
  @search_string = params[:search_term]
  @location = params[:location]
  @results = YelpAdapter.new.search(@search_string, @location)
  p @results[0]
  erb :'results'
end 

