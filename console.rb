require_relative('models/casting.rb')
require_relative('models/movie.rb')
require_relative('models/star.rb')

require('pry-byebug')

Casting.delete_all()
Movie.delete_all()
Star.delete_all()


star1 = Star.new ({'first_name' => 'Ray', 'last_name' => 'Liotta'})
star1.save()
star2 = Star.new ({'first_name' => 'Jason', 'last_name' => 'Statham'})
star2.save
star3 = Star.new ({'first_name' => "Richard", 'last_name' => 'Pryor'})
star3.save()

movie1 = Movie.new ({'title' => 'Goodfellas', 'genre' => 'Crime', 'rating' => '10'})
movie1.save()
movie2 = Movie.new ({'title' => 'Snatch', 'genre' => 'Crime', 'rating' => '9'})
movie2.save()
movie3 = Movie.new ({'title' => 'See no Evil', 'genre' => 'Comedy', 'rating' => '8'})
movie3.save()



casting1 = Casting.new ({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => '5000000'})
casting1.save()
casting2 = Casting.new ({'movie_id' => movie2.id, 'star_id' => star2.id, 'fee' => '3000000'})
casting2.save()
casting3 = Casting.new ({'movie_id' => movie3.id, 'star_id' => star3.id, 'fee' => '1000000'})
casting3.save()

binding.pry
nil
