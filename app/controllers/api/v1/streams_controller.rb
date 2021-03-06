require 'httparty'

class Api::V1::StreamsController < ApplicationController
  before_action :set_user, only: [:create, :update, :show, :destroy]


  def create
    @stream = @user.build_stream(stream_params)
    if @stream.save
      render json: StreamSerializer.new(@stream), status: :created
    else
      render json: @stream.errors, status: :unprocessable_entity
    end
  end

  def show
    if logged_in?
      @stream = @user.stream
      render json: StreamSerializer.new(@stream), status: :ok
    else
      render json: {
        notice: 'Must be logged in to view streams'
      }
    end 
  end

  def stream_sources
    @stream = Stream.find(params[:stream_id])
    @sources = @stream.sources
    render json: SourceSerializer.new(@sources), status: :ok
  end

  def single_source
    @stream = Stream.find(params[:stream_id])
    @source = Source.find(params[:source_id])
    if params[:update] == "true"
      @stream.sources << @source
      @sorted_sources = @stream.sources.sort
      render json: SourceSerializer.new(@sorted_sources), status: :ok
    else
      @stream.sources.delete(@source)
      @sorted_sources = @stream.sources.sort
      render json: SourceSerializer.new(@sorted_sources), status: :ok
    end
  end





  # PATCH/PUT /streams/1
  # PATCH/PUT /streams/1.json
  def update
    @stream = @user.stream
    if @stream.update(stream_params)
      options = {}
      options[:include] = [:sources, :'sources.name', :'sources.api_id', :'sources.url']
      render json: StreamSerializer.new(@stream, options), status: :ok
    else
      render json: @stream.errors, status: :unprocessable_entity
    end
  end

  def get_stream
    @user = User.find(params[:user_id])
    @stream = @user.stream
    api_ids = []
    @stream.sources.each do |source|
      api_ids << source.api_id
    end
    formatted_ids = api_ids.join(",")
    api_key = ENV["NEWS_API_SECRET"]
    response = @stream.id, HTTParty.get("https://newsapi.org/v2/top-headlines?sources=#{formatted_ids}&apiKey=#{api_key}&pageSize=100")
    render json: response, status: 200 
  end 


  # DELETE /streams/1
  # DELETE /streams/1.json
  def destroy
    @stream = @user.stream
    @stream.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stream
      @stream = current_user.stream
    end

    def set_user
      @user = User.find(params[:stream][:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stream_params
      params.require(:stream).permit(:user_id, :source_id, :update, source_ids:[], source_api_ids:[])
    end

end
