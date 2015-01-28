get '/photos' do
  erb :'photos/index'
end

get '/photos/new' do
  erb :'photos/new'
end

post '/photos' do
  erb :'photos/index'
end

get '/photos/:id/edit' do
  erb :'photos/edit'
end

get '/photos/:id' do
  erb :'photos/show'
end

put '/photos/:id' do
  erb :'photos/show'
end

delete '/photos/:id' do
  erb :index
end
