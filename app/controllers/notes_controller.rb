class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /notes
  # GET /notes.json
  def index
    @notes = current_user.notes.paginate(:page => params[:page])
  end

  # GET /notes/1
  # GET /notes/1.json
  def show

  end

  # GET /notes/new
  def new
    @note = Note.new
    @note.attachments.build
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.user = current_user
    respond_to do |format|
      if @note.save
        format.js
        format.html { redirect_to root_path, notice: 'Note has been created.' }
      else
        #format.html { render :new }
        format.js { render  :new }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.js
      else
        format.js { render :edit }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      #prevent from searching note from different user
      @note = current_user.notes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :description, attachments_attributes: [:file, :file_cache])
    end
end
