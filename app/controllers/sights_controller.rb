class SightsController < ApplicationController
def index
    sights = Sight.all
    render json: sights 
end

def show
    sight = Sight.find(params[:id])
    render json: sight
end

def create
    sight = Sight.create(sight_params)
    if sight.valid?
        render json: sight
    else
        sight.errors
    end
end

def update
    sight = Sight.find(params[:id])
    sight.update(sight_params)
    if sight.valid?
        render json: sight
    else
        sight.errors
    end
end

def destroy
    sight = Sight.find(params[:id])
    if sight.destroy
        render json: sight
    end
end

def sight_params
    params.require(:sight).permit(:latitude, :longitude, :date, :animal_id)
end
end


