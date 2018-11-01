class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_params)
    respond_to do |format|
      if @dose.save
        format.html {redirect_to @dose, notice: 'doses esta sendo feito'}
        format.json {render :show, status: :created, location: @dose}
      else
        format.html {render :new}
        format.json {render json: @cocktail.erros, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dose.destroy
  end
end

private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def doses_params
    params.require(:dose).permit(:name)
  end
