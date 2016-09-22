# SHOW HTML FORM FOR NEW USER
get '/users/new' do
  erb :'users/new' #show all users view (index)
end

# NEW USER CREATE
post '/users' do
  p params
  @user = User.create(user_name: params[:user_name], email: params[:email], password: params[:password])

  if @user
    session[:user_id] = @user.id
     redirect "/users/#{@user.id}"
  else
    @errors = "Invalid login information. Please try again"
    erb :'sessions/new'
  end
end

# DISPLAY SPECIFIC USER
get '/users/:id' do
  #gets params from url
  @user = User.find(params[:id]) #define instance variable for view
  @auctions = Auction.all
  erb :'users/show' #show single user view
end

