# SHOW ALL AUCTIONS
get '/auctions' do
  @auctions = Auction.all
  erb :'auctions/index'
end

# SHOW FROM TO CREATE NEW ARTICLE
get '/auctions/new' do
  erb :'auctions/new'
end

# AUCTIONS CREATE NEW
post '/auctions' do
@auction = Auction.new(params[:auction]) #create new auction
  if @auction.save #saves or returns false if unsuccessful
    redirect "/auctions" #redirect back to specific
  else
    erb :'auctions/new' # show new auctions view again(potentially displaying errors)
  end
end

# AUCTIONS DISPLAY
get '/auctions/:id' do
  @auction = Auction.find(params[:id]) #define instance variable for view
  erb :"auctions/show" #show single auction view
  # redirect from post to get route
end

# AUCTIONS SHOW EDIT FORM
get '/auctions/:id/edit' do
  @auction = Auction.find(params[:id])
  erb :'auctions/edit'
end

# AUCTION EDIT
put '/auctions/:id' do
  #get params from user input
  @auction = Auction.find(params[:id])

  @auction.assign_attributes(params[:auction]) #assign new attributes

  if @auction.save
    redirect "/auctions/#{@auction.id}" #redirect auction index page
  else
    erb :'auctions/edit' #show edit auction view again(potentially displaying errors)
  end

end

# AUCTION DELETE
delete '/auctions/:id' do
  #get params from url
  @auction = Auction.find(params[:id]) #find auction to delete
  @auction.destroy
  redirect '/auctions' #redirect back to auctions index page

end

















