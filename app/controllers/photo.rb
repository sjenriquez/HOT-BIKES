get '/photos' do      # Display all photos from all users
  @photos = Photo.all
  erb :'photos/index'
end

get '/photos/new' do  # Route to new photo form
  erb :'photos/new'
end

post '/photos' do     # Post route for new photo
  p params
  photo = Photo.create!(params[:photo])
  current_user.photos << photo
  redirect("/photos/#{photo.id}")
end

get '/photos/:id/edit' do
  erb :'photos/edit'
end

get '/photos/:id' do  # Display photo
  photo = Photo.find_by(id: params[:id])
  erb :'photos/show', locals: {photo: photo}
end

put '/photos/:id' do
  erb :'photos/show'
end

delete '/photos/:id' do
  erb :index
end

post '/like' do       # User likes a photo
  current_user.liked_photos << Photo.find_by(id: params[:photo_id])
  redirect("/photos/#{params[:photo_id]}")
end
