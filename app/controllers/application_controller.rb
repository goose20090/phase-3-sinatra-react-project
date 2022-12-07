class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Returns a JSON response of all instances of the Movie class
  get "/movies" do
    movies = Movie.all
    movies.to_json(include:{reviews: {include: :user}})
  end

  # Returns a movie's reviews and relevant users, with that movie's average rating

  get "/movies/:id/reviews" do 
    movie = Movie.find(params[:id])
    return_hash = movie.get_reviews_with_user_and_average_rating
    return_hash.to_json
  end

  get "/users" do
    users = User.all
    users.to_json(include:{reviews: {include: :movie}})
  end

  get "/users/:id/reviews" do 
    user = User.find(params[:id])
    return_hash = user.get_reviews_with_movie
    return_hash.to_json
  end

end
