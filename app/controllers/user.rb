get '/user/:id/edit' do
  user = User.find_by(id: params[:id])
  erb :'users/edit', locals: {user: user}
end

get '/user/:id' do
  user = User.find_by(id: params[:id])
  erb :'users/show', locals: {user: user}
end

put '/user/:id' do
  user = User.find_by(id: params[:id])
  p params
  p user
  user.update(params[:user])
  redirect ("/user/#{user.id}")
end
