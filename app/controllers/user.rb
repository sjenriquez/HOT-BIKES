get '/user/:id' do
  user = User.find_by(id: params[:id])
  erb :'users/show', locals: {user: user}
end

