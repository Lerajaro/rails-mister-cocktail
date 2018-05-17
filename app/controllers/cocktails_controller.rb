class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail.id)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredient_id, :dose_id)
  end
end
