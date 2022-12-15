class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Returns a JSON response of all instances of the Movie class
  get "/movies" do
    movies = Movie.all
    movies.to_json(include:{reviews: {include: :user}})
  end

  # Returns a movie's reviews and relevant users, with that movie's average rating

  get "/users" do
    users = User.all
    users.to_json(include:{reviews: {include: :movie}})
  end

end
