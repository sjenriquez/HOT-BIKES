get '/photos' do      # Display all photos from all users
  @photos = Photo.all
  erb :'photos/index'
end

get '/photos/new' do  # Route to new photo form
  erb :'photos/new'
end

post '/photos' do     # Post route for new photo
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
