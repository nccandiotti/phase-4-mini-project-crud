class SpicesController < ApplicationController

    #get
    def index
        spices = Spice.all
        render json: spices
      end

    #create
    def create
        new_spice = Spice.create(spice_params)
        render json: new_spice, status: :complete

    end

    #update
    def updated
        spice = find_spice
        spice.update(spice_params)
        render json: spice

    end
    #delete
    def destroy 
        spice = find_spice
        spice.destroy
        head :no_content

    end

    private

    def find_spice
        Spice.find_by(params[:id])
      end
    def spice_params
        params.permit(:title, :image, :description, :rating, :notes)
    end
end
