get '/photos' do            # Display all photos from all users
  @photos = Photo.all
  erb :'photos/index'
end

get '/photos/new' do        # Route to new photo form
  erb :'photos/new'
end

post '/photos' do           # Post route for new photo
  photo = Photo.new(params[:photo])
  if photo.save
    current_user.photos << photo
    redirect("/user/#{current_user.id}")
  else
    @errors = photo.errors.messages
    erb :'photos/new'
  end
end

get '/photos/:id/edit' do   # Edit photo
  photo = Photo.find_by(id: params[:id])
  erb :'photos/edit', locals: {photo: photo}
end

get '/photos/:id' do        # Display photo
  photo = Photo.find_by(id: params[:id])
  erb :'photos/show', locals: {photo: photo}
end

put '/photos/:id' do        # Edit photo
  photo = Photo.find_by(id: params[:id])
  photo.update(title: params[:title])

  if request.xhr?
    photo.title.to_s
  else
    redirect ("/photos/#{params[:id]}")
  end
end

delete '/photos/:id' do     # Delete photo
  Photo.find_by(id: params[:id]).destroy
  redirect ('/photos')
end

post '/like' do             # User likes a photo
  photo = Photo.find_by(id: params[:photo_id])
  current_user.liked_photos << photo

  if request.xhr?
    photo.users_liked.count.to_s
  else
    redirect("/photos/#{params[:photo_id]}")
  end
end

after do
  ActiveRecord::Base.connection.close
end
