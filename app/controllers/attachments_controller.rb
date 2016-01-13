class AttachmentsController < ApplicationController
  def new
    @index = params[:index].to_i
    @note = Note.new
    @note.attachments.build
    render layout: false
  end
end
