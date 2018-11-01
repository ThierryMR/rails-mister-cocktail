class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  # def edit
  # end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    respond_to do |format|
      if @cocktail.save
        format.html {redirect_to @cocktail, notice: 'Cocktail esta sendo feito'}
        format.json {render :show, status: :created, location: @cocktail}
      else
        format.html {render :new}
        format.json {render json: @cocktail.erros, status: :unprocessable_entity }
      end
    end
  end

 private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end


end
