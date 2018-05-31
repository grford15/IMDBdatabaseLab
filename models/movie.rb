require_relative('../db/sql_runner.rb')

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :rating

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @rating = options['rating']
  end

  def save()
    sql = "INSERT INTO movies (title, genre, rating) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @rating]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'][0].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM movies"
    values = []
    movies = SqlRunner.run(sql, values)
    return movies.map { |movie| Movie.new(movie)}
  end

  def update()
    sql = "UPDATE movies SET title = $1, genre = $2, rating = $3 WHERE id = $4"
    values = [@title, @genre, @rating, @id]
    SqlRunner.run(sql, values)
  end

end
