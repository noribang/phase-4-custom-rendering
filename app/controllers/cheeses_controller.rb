class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # render json: cheeses

    # Include using serialization option only:
    # render json: cheeses, only: [:id, :name, :price, :is_best_seller]

    # Exclude using serialization option except:
    render json: cheeses, except: [:created_at, :updated_at]

  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    # render json: cheese

    # render json: {
    #   id: cheese.id,
    #   name: cheese.name,
    #   price: cheese.price,
    #   is_best_seller: cheese.is_best_seller
    # }

    # Add summary Model method.
    render json: cheese, except: [:created_at, :updated_at], methods: [:summary]

  end

end
