class RestaurentsController < ApplicationController
  before_action :set_restaurent, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, except: [:index, :show]


  # GET /restaurents
  # GET /restaurents.json
  def index
    @restaurents = Restaurent.all
  end

  # GET /restaurents/1
  # GET /restaurents/1.json
  def show
    @reviews = Review.where(restaurent_id: @restaurent.id).order("created_at DESC")
    if @reviews.blank?
      @avg_rating = 0
    else
    @avg_rating = @reviews.average(:rating).round(2)
  end
  end

  # GET /restaurents/new
  def new
    @restaurent = Restaurent.new
  end

  # GET /restaurents/1/edit
  def edit
  end

  # POST /restaurents
  # POST /restaurents.json
  def create
    @restaurent = Restaurent.new(restaurent_params)

    respond_to do |format|
      if @restaurent.save
        format.html { redirect_to @restaurent, notice: 'Restaurent was successfully created.' }
        format.json { render action: 'show', status: :created, location: @restaurent }
      else
        format.html { render action: 'new' }
        format.json { render json: @restaurent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurents/1
  # PATCH/PUT /restaurents/1.json
  def update
    respond_to do |format|
      if @restaurent.update(restaurent_params)
        format.html { redirect_to @restaurent, notice: 'Restaurent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @restaurent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurents/1
  # DELETE /restaurents/1.json
  def destroy
    @restaurent.destroy
    respond_to do |format|
      format.html { redirect_to restaurents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurent
      @restaurent = Restaurent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurent_params
      params.require(:restaurent).permit(:name, :address, :phone, :website, :image)
    end
    
    def check_user
      unless current_user.admin?
        redirect_to root_url, alert: "Sorry only admins can do that!"
      end
    end
end
