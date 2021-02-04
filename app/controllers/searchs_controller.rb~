class SearchesController < ApplicationController
    def show
        @search = Search.find(params[:id])
    end 

    def new 
        @search = Search.new
        @wifi = Room.distinct.pluck(:wifi)
        @prese = Room.distinct.pluck(:prese)
        @riscaldamento = Room.distinct.pluck(:riscaldamento)
    end

    def create
        @search = Search.create(search_params)
        redirect_to @search
    end 

    private

    def search_params
        params.require(:search).permit(:name, :wifi, :prese, :riscaldamento)
    end 
end
