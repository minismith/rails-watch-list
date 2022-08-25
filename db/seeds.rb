# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'json'
require 'open-uri'

url = 'https://tmdb.lewagon.com/movie/popular'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)["results"]

movies.each do |movie|
  rating = movie['vote_average'].to_f
  poster_url = "https://image.tmdb.org/t/p/w200#{movie['poster_path']}"
  overview = movie['overview']
  title = movie['title']

  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
end

List.create(name: "Classics")
List.create(name: "Scary boys")
