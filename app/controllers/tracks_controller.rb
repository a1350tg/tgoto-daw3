class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  # GET /tracks
  # GET /tracks.json
  def index
    @tracks = Track.all
    @users=User.all
    @projects=Projects.all
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
    @part = Track.find(params[:id])
    @users=User.all
    @projects=Projects.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @part }
    end
  end

  # GET /tracks/new
  def new
    @track = Track.new
    @users=User.all
    @projects=Projects.all
  end

  # GET /tracks/1/edit
  def edit
    @track = Track.find(params[:id])
    @users=User.all
    @projects=Projects.all
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to @track, notice: 'Track was successfully created.' }
        format.json { render action: 'show', status: :created, location: @track }
      else
        format.html { render action: 'new' }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:name, :instrument, :score, :project_id, :user_id)
    end
end
