class EndorsementsController < ApplicationController

  def new
    @endorsements = Endorsement.new
  end

  def create
    @endorsements = Endorsement.new(endorsement_params)
    if @endorsements.save
      Investor.find(@endorsements.endorsed).increment!(:rank)
      flash[:notice] = "#{@endorsements.investor.full_name}, thank you for adding your endorsement!"
      redirect_to root_path
    else
      flash[:notice] = "Uh-oh, something went wrong and this endorsement was not saved. Please try again."
      render :new
    end
  end

  private

  def endorsement_params
    params.require(:endorsement).permit(:investor_id, :endorsed, :comment)
  end

end
