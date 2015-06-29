class RecommendationsController < ApplicationController

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.new(recommendation_params.merge(investor_id: 1))
    if @recommendation.save
      Investor.find(@recommendation.recommend1).increment!(:rank) if @recommendation.recommend1 != nil
      Investor.find(@recommendation.recommend2).increment!(:rank) if @recommendation.recommend2 != nil
      Investor.find(@recommendation.recommend3).increment!(:rank) if @recommendation.recommend3 != nil

      flash[:notice] = "#{@recommendation.investor.full_name}, thank you for adding recommendations!"
      redirect_to root_path
    else
      flash[:notice] = "Uh-oh, something went wrong and these recommendations were not saved. Please try again."
      render :new
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:investor_id, :recommend1, :recommend2, :recommend3)
  end

end
