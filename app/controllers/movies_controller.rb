class MoviesController < ApplicationController 
  def index
    @movies = Movie.all
  end

  # DO I NEED THIS?
  # def new 
  #   @movie = Movie.new
  # end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "Movie added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.detroy!

    respond_to do |format|
      format.html { redirect_to movies_path, notice: "Movie deleted", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :watched_at)
  end
end