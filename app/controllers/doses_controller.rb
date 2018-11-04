class DosesController < ApplicationController
  before_action :set_cocktail

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to dose_path
    else
      render :new
    end
  end

  def edit
    @dose = Dose.find(params[:id])
  end

  def update
    @dose = Dose.find(params[:id])
    @dose.update(dose_params)

    redirect_to root_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient, :description)
  end
end
#   before_action :set_cocktail, only: [:new, :create]
#   def new
#     # Aqui estou associando o cocktail e sua localizacao
#     # @cocktail = Cocktail.find(params[:cocktail_id])
#     # Aqui, o doses passa uma relacao, o build poe um alemento a mais no array
#     # @dose = @cocktail.doses.build
#     @dose = Dose.new
#     @ingredient = Ingredient.all
#   end

#   def show

#   end

#   def create
#     @ingredient = Ingredient.all
#     @cocktail = Cocktail.find(params[:cocktail_id])
#     @dose = Dose.new(doses_params)
#     @dose.cocktail = @cocktail
#     # @dose.cocktail_id = Cocktail.find(parms[:cocktail_id]).id
#       if @dose.save
#         redirect_to cocktail_path(@cocktail)
#       else
#         render :new
#       end
#   end

#   def destroy
#     @dose = Dose.where(params[:id])
#     # @dose.destroy
#     # redirect_to cocktails_path
#   end
# end

# private

#   def set_cocktail
#     @cocktail = Cocktail.find(params[:id])
#   end

#   def doses_params
#     params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
#   end
