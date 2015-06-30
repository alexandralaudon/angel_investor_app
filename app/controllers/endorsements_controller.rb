class EndorsementsController < ApplicationController

  def new
    @endorsement = Endorsement.new
  end

  def create
    @endorsement = Endorsement.new(endorsement_params)
    if @endorsement.save
      Investor.find(@endorsement.endorsed).increment!(:rank)
      flash[:notice] = "#{@endorsement.investor.full_name}, thank you for adding your endorsement!"
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
