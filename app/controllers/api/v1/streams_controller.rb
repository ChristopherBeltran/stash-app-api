class Api::V1::StreamsController < ApplicationController
  before_action :set_stream, only: [:show, :update, :destroy]

  # GET /streams
  # GET /streams.json
  def index
    @streams = Stream.all
  end

  # GET /streams/1
  # GET /streams/1.json
  def show
    if logged_in?
      @stream = current_user.stream
      render :json StreamSerializer.new(@stream), status: :ok
    else
      render :json {
        'Must be logged in to view streams'
      }
  end

  # POST /streams
  # POST /streams.json
  def create
    @stream = Stream.new(stream_params)

    if @stream.save
      render :json StreamSerializer.new(@stream), status: :ok
    else
      render json: @stream.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /streams/1
  # PATCH/PUT /streams/1.json
  def update
    if @stream.update(stream_params)
      render :show, status: :ok, location: @stream
    else
      render json: @stream.errors, status: :unprocessable_entity
    end
  end

  # DELETE /streams/1
  # DELETE /streams/1.json
  def destroy
    @stream.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stream
      @stream = Stream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stream_params
      params.require(:stream).permit(:user_id, source_ids:[], source_attributes: [:name])
    end
end
