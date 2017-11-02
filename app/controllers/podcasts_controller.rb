# the podcasts controller
class PodcastsController < ApplicationController
  before_action :set_podcast, only: %i[show edit update destroy download]

  # GET /podcasts
  def index
    @podcasts = Podcast.all.order(:title)
  end

  # GET /podcasts/1
  def show; end

  # GET /podcasts/new
  def new
    @podcast = Podcast.new
  end

  # GET /podcasts/1/edit
  def edit; end

  # POST /podcasts
  def create
    @podcast = Podcast.new(podcast_params)

    if @podcast.save
      redirect_to @podcast, notice: 'Podcast was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /podcasts/1
  def update
    if @podcast.update(podcast_params)
      redirect_to @podcast, notice: 'Podcast was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /podcasts/1
  def destroy
    @podcast.destroy
    redirect_to podcasts_url, notice: 'Podcast was successfully destroyed.'
  end

  # GET /podcasts/1/download
  def download
    send_file @podcast.mp3_file, type: 'application/mp3', filename: @podcast.title + '.mp3'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_podcast
    @podcast = Podcast.find(params[:id] || params[:podcast_id])
  end

  # Only allow a trusted parameter "white list" through.
  def podcast_params
    params.require(:podcast).permit(:title, :mp3, :date)
  end
end
