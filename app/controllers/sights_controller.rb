class SightsController < ApplicationController
def index
    sights = Sight.where(date: '2023-01-01'..'2027-01-01')
    render json: sights 
end

def show
    sight = Sight.find_by(id: params[:id])
    render json: sight, include: [:animal]
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


