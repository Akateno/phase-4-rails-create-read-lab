class PlantsController < ApplicationController

    def index 
        plants=Plant.all 
        render json: plants
    end 

    def show 
        plant = Plant.find_by(id: params[:id])
        if plant 
            render json: plant
        else 
            render json: {error: "Plants not found!!!"}, status: :not_found
        end 
    end 

    #this would also work but they want strong params 
    # def create
    #     plant=  Plant.create(name: params[:name], image: params[:image], price: params[:price] )
    #     render json: plant, stats: :created
    #     #stats created sends 201 code, indicating request has suceeded 
    # end 


    #using strong params
    
    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created 
    end 


    private 
    #all methods below are private 

    def plant_params
        params.permit(:name, :image, :price)
    end 
end
