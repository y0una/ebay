# VIEW FORM
get '/sessions/new' do
  erb :'sessions/new' #show new sessions view
end

# CREATE NEW SESSION
post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user

    session[:user_id] = @user.id
    redirect "/users/#{@user.id}" #redirect back to sessions index page
  else
    @errors = "Invalid login information. Please try again"
    erb :'sessions/new' # show new sessions view again(potentially displaying errors)
  end
end

# DELETE A SESSION
# looks for delete request and route /sessions
delete '/logout' do
  session[:user_id] = nil
  redirect '/' #redirect back to users index page
end

