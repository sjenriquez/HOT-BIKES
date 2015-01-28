20.times do
  password = Faker::Internet.password
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    bio: Faker::Hacker.say_something_smart
    )
end


100.times do
  suckr = ImageSuckr::GoogleSuckr.new
  Photo.create(
   url:  suckr.get_image_url({"q" => "feet"}),
   user_id: (1..10).sample
   )
end

20.times do
  like = Like.create(
    photo_id: (1..100).sample,
    user_id: (1..20).sample
    )
end
