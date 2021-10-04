class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show edit update destroy add_tag]

  # GET /images or /images.json
  def index
    page = params[:page] ||= 1
    @images = Image.page(page).per(2)
  end

  # GET /images/1 or /images/1.json
  def show
    @tags = @image.tag_list
  end

  # GET /images/new
  def new
    @image      = Image.new
    @image_tags = ActsAsTaggableOn::Tag.all
  end

  # GET /images/1/edit
  def edit
    @image_tags = ActsAsTaggableOn::Tag.all
  end

  # POST /images or /images.json
  def create
    @image = Image.new(image_params)
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: "Image was successfully created." }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1 or /images/1.json
  def update
    @image_tags     = ActsAsTaggableOn::Tag.all

    tag_list        = params[:image][:tag_list]
    @image.tag_list = tag_list.keys.select{|t| tag_list[t] == "1"}


    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: "Image was successfully updated." }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1 or /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: "Image was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_tag
    # tag_list = params[:tag_list].split(",")
    # tag_list.each do |tag|
    #   @image.tag_list.add(tag)
    # end
    @image.tag_list = params[:tag_list]
    if @image.save
      redirect_to image_url(@image)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      #params.fetch(:image, [:uploaded_image])
      params.require(:image).permit(:uploaded_image, :tag_list)
    end
end


















