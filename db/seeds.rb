# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times {|i| rubric = Rubric.create!({
                                          title: "Rubric #{i + 1}"})
  10.times {|j| rubric.posts.create!({
                                                title: "Post #{j + 1}",
                                                body: "Post #{j + 1}"})
  }
}

posts = Post.all
posts.each  do |p|
  5.times{|m| p.cmmnts.create!({
                                      body: "Comment #{m + 1}"
                                  })
  }
end

rub1 = Rubric.create!({ title: "The first rubric with common post"})

rub2 = Rubric.create!({ title: "The second rubric with common post"})

common = rub1.posts.create!({ title: "I am common post", body: "My parents are rubric with id=11 and rubic with id=12"})

rub2.posts << common

