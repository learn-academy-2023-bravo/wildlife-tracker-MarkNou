class AnimalsController < ApplicationController
    def index
        animals = Animal.all
        render json: animals
    end

    def show
        animal = Animal.find(params[:id])
        render json: animal
    end

    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: { errors: animal.errors }, status: :unprocessable_entity
        end
    end

    def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
            render json: Animal
        else
            render json: { errors: animal.errors }, status: :unprocessable_entity
        end
    end

    def destroy
        animal = Animal.find(params[:id])
        if animal.destroy
            render json: animal
        else
            animal.errors
        end

    end

    def animal_params
        params.require(:animal).permit(:common, :binomial)
    end
end
