class SongsController < ApplicationController

  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      flash[:errors] = "You ain't done this shit right"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to @song
    else
      flash[:errors] = "Ya dun goofed"
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def upvote
    @song = Song.find(params[:id])
    if current_user
      if @song.votes.create(user_id: current_user.id)
       #flash[:notice] =  "Thank you for upvoting!"
       redirect_to(songs_path)
      else
       #flash[:notice] =  "You have already upvoted this!"
       redirect_to(songs_path)
      end
    else
      redirect_to login_path
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
