class ProductionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_production, only: [:show]

  def new
    @production = Production.new
  end

  def show
    @dproductions = @production.dproductions
    @dproduction = Dproduction.new
  end

  def edit
    @production = Production.find(params[:id])
  end


  def update
    @production = Production.find(params[:id])
    if @production.update(production_params)
      redirect_to productions_path
    else
        render :edit
    end
  end

  def index
    @productions = Production.all()
  end

  def create
    @production = Production.new(production_params)
    if @production.save
      redirect_to production_path(@production)
    else
      render :new
    end
  end
def destroy 
  @production = Production.find(params[:id]).destroy
end
  private

  def production_params
    params.require(:production).permit(:ref)
  end

  def set_production
    @production = Production.find(params[:id])
  end
end
