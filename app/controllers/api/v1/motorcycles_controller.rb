class Api::V1::MotorcyclesController < ApplicationController
    skip_before_action :verify_authenticity_token, only: %i[create destroy]
    load_and_authorize_resource
    before_action :set_motorcycle, only: %i[show destroy]
    def index
      @motorcycles = Motorcycle.all
      authorize! :read, @motorcycles
      if @motorcycles.size.positive?
        render json: { success: true, data: @motorcycles }, status: :ok
      else
        render json: { success: true, message: 'Upps! there is not Motorcycle for while!😁' }, status: :ok
      end
    end
  
    
  
    private
  
    def set_motorcycle
      @motorcycle = Motorcycle.find(params[:id])
    end
  
    def motorcycle_params
      params.require(:motorcycle).permit(:name, :color, :chassisNumber, :bookingPricePerHour, :brand, :model, :price, :imageLink, :description)
    end
  end