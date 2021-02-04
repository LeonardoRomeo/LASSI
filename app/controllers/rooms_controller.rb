class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_thirdpart!

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
   
    if params[:Cerca_aula] && params[:Cerca_aula] != "" 
      @parameter = params[:Cerca_aula].downcase
      @rooms = @rooms.where("name like :search", search: "%#{@parameter}%")     
    end
    

  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @rooms =Room
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.create!(params[:room].permit(:name,:num_posti_tot, :num_posti_liberi, :h_ape, :h_chiu, :wifi, :prese, :riscaldamento,:image))
    authorize! :create, @room, :message => "ATTENZIONE non sei autorizzato a fare CREATE  una nuova Room"
    flash[:notice] = "#{@room.name} è stata creata con successo."
    redirect_to rooms_path
    
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    id = params[:id]
    @room = Room.find(id)
    authorize! :update, @room, :message => "ATTENZIONE non sei autorizzato a fare UPDATE di una nuova Room"
    @room.update_attributes!(params[:room].permit(:name,:num_posti_tot, :num_posti_liberi, :h_ape, :h_chiu, :wifi, :prese, :riscaldamento))
    flash[:notice] = "#{@room.name} was successfully updated."
    redirect_to room_path(@room)
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    id = params[:id]
    @room = Room.find(id)
    authorize! :destroy, @room, :message => "ATTENZIONE non sei autorizzato a fare DELETE di una nuova Room"
    @room.destroy
    flash[:notice] = "#{@room.name} has been deleted."
    redirect_to rooms_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    def is_search?

      @search.conditions

    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :num_posti_tot, :num_posti_liberi, :h_ape, :h_chiu, :wifi, :prese, :riscaldamento, :student_id, :search_by_name, :image)
    end
end
