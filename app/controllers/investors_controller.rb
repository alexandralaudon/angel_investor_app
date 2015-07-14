class InvestorsController < ApplicationController

  def index
    if params[:search]
      @investors = Investor.search(params[:search]).order(rank: :desc).paginate(:per_page => 10, :page => params[:page])
    else
      @investors = Investor.order(rank: :desc).paginate(:per_page => 10, :page => params[:page])
    end
    render partial: 'investors', layout: false if request.xhr?
  end

  def new
    @investor = Investor.new
  end

  def create
    @investor = Investor.new(investor_params)
    if @investor.save
      flash[:notice] = "#{@investor.full_name} has been saved to the database."
      redirect_to root_path
    else
      flash[:notice] = "Uh-oh, something went wrong and this investor was not saved. Try again."
      render :new
    end
  end

  def show
    @investor = Investor.find(params[:id])
    @endorsements = Endorsement.where(endorsed_id: @investor.id)
  end

  def edit
    @investor = Investor.find(params[:id])
  end

  def update
    @investor = Investor.find(params[:id])
    if @investor.update(investor_params)
      flash[:notice] = "#{@investor.full_name} has been updated!"
      redirect_to root_path
    else
      flash[:notice] = "Uh-oh, something went wrong and this investor was not updated. Try again."
      render :edit
    end
  end

  def destroy
    @investor = Investor.find(params[:id])
    @investor.destroy
    flash[:notice] = "#{@investor.full_name} has been deleted from the system."
    redirect_to root_path
  end

  def import
    Investor.import(params[:file])
    flash[:notice] = "Investors imported."
    redirect_to root_path
  end

  private

  def investor_params
    params.require(:investor).permit(:first_name, :last_name, :company, :email, :rank)
  end

end
