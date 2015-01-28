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

suckr = ImageSuckr::GoogleSuckr.new

User.all.each do |user|
  user.photos << Photo.create(url: suckr.get_image_url({"q" => "motorcycle"}))
end

User.all.each do |user|
  5.times do
    user.liked_photos << Photo.all.sample
  end
end
