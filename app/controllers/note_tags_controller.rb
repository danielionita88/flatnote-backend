class NoteTagsController < ApplicationController

    def index
        note_tags = NoteTag.all 
        render json: note_tags
    end

    def destroy
        note=Note.find_by(name: params[:name])
        note_tags=NoteTag.find_by(note_id: note.id)
        note_tags.delete()
    end
end
