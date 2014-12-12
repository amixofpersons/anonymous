30.times { User.create(name: Faker::Internet.user_name, password: 'password', email: 'abc@gmail.com') }
30.times { User.all.sample.posts << Post.new(body: Faker::Lorem.paragraph, title: Faker::Lorem.sentence ) }
300.times { User.all.sample.comments << Comment.new(content: Faker::Company.bs, post: Post.all.sample) }

50.times { Comment.all.sample.votes << Vote.new(user: User.all.sample) }
50.times { Comment.all.sample.votes << Vote.new(user: User.all.sample) }

50.times { Post.all.sample.votes << Vote.new(user: User.all.sample) }
50.times { Post.all.sample.votes << Vote.new(user: User.all.sample) }

# TO-DO: Add tags
