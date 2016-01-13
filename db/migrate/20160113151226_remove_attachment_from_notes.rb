class RemoveAttachmentFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :attachment, :string
  end
end
