class TagsController < ApplicationController

    def index
        tags = Tag.all 
        render json: tags
    end

    def create
        tag = Tag.create(params[:id])
        render json: tag
    end

end
