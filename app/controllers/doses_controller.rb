class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  def new
    # Aqui estou associando o cocktail e sua localizacao
    # @cocktail = Cocktail.find(params[:cocktail_id])
    # Aqui, o doses passa uma relacao, o build poe um alemento a mais no array
    @dose = @cocktail.doses.build
  end

  def create
    @dose = Dose.new(doses_params)
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end
end

private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
