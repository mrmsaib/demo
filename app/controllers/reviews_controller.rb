class ReviewsController < ApplicationController
  
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_restaurent
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.restaurent_id = @restaurent.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurent_path(@restaurent.id), notice: 'Review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @review }
      else
        format.html { render action: 'new' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end
    
    def set_restaurent
      @restaurent = Restaurent.find(params[:restaurent_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
