class NotesController < ApplicationController
    

    def index
        notes = Note.all 
        render json: notes, include: :tags
    end

    def new
        note = Note.new
    end

    def create
        note = Note.create(title: params[:title], content: params[:content], user_id: params[:user_id])
        render json: note
    end

    def show
        note = Note.find(params[:id])
        render json: note
    end

    def edit
    end

    def update
        note=Note.find(params[:id])
  
        tags = params[:tags].map{|tag|
            tag = Tag.find_or_create_by(name:tag)
            NoteTag.find_or_create_by(tag_id: tag.id, note_id: note.id)
        }
        
        note.update(title: params[:title],
        content: params[:content])
        
        render json: note, include: :tags
    end

    def destroy
        note= Note.find(params[:id])
        note.delete()
        render json:{message: 'note deleted succesful'}
    end

end
