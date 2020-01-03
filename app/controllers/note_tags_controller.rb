class NoteTagsController < ApplicationController

    def index
        note_tags = NoteTag.all 
        render json: note_tags
    end
end
