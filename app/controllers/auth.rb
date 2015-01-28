get '/' do
  if current_user
    redirect '/photos'
  else
    erb :index
  end
end

get '/login' do
  erb :'auth/login'
end

post '/login' do
  user = User.find_by(email: params[:user][:email])

  if user.try(:authenticate, params[:user][:password])
    session[:user_id] = user.id
    redirect '/photos'
  else
    redirect '/login'
  end

end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  user = User.create(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect '/photos'
  else
    redirect '/signup'
  end

end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
