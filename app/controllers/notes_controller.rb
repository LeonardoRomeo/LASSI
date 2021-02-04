class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
 

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
    if params[:Cerca_appunti] && params[:Cerca_appunti] != "" && params[:argument] && params[:argument] != ""
      @parameter = params[:Cerca_appunti].downcase
      @argument_parameter = params[:argument]
      @notes = @notes.where("nome like :search", search: "%#{@parameter}%")
      @notes = @notes.where("argument like :search", search: "%#{@argument_parameter}%")
    end
    if params[:Cerca_appunti] && params[:Cerca_appunti] != "" 
      @parameter = params[:Cerca_appunti].downcase
      @notes = @notes.where("nome like :search", search: "%#{@parameter}%")     
    end
    if params[:argument] && params[:argument] != ""
      @argument_parameter = params[:argument]
      @notes = @notes.where("argument like :search", search: "%#{@argument_parameter}%")
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
    authorize! :update, @note, :message => "ATTENZIONE non sei autorizzato a fare UPDATE di questa Note"
  end

  # POST /notes
  # POST /notes.json
  def create    
    @note = Note.new(note_params)    
    authorize! :create, @note, :message => "ATTENZIONE non sei autorizzato a fare CREATE di una nuova Note"
    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    authorize! :update, @note, :message => "ATTENZIONE non sei autorizzato a fare UPDATE di questa Note"
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    authorize! :destroy, @note, :message => "ATTENZIONE non sei autorizzato a fare DELETE di questa Note"
    @note.destroy    
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:nome, :argument, :file, :student_id, :pdf)
    end
end
