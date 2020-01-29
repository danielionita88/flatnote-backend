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
        if params[:tags].length > 0
            tags = params['tags'].map{|tag| 
                if tag.length>= 3
                Tag.find_or_create_by(name: tag)
                end
            }
            note_tags= tags.map{|tag| NoteTag.find_or_create_by(tag_id: tag.id, note_id: note.id)}
        end
        render json: note, include: :tags
    end

    def show
        note = Note.find(params[:id])
        render json: note
    end

    def edit
    end

    def update
        note=Note.find(params[:id])
        params[:tags].map{|tag|
            if tag.length >= 3 
            tag = Tag.find_or_create_by(name:tag)
            NoteTag.find_or_create_by(tag_id: tag.id, note_id: note.id)
            end
        }
        tags_name= note.tags.map{|tag| tag.name }
        deleted_tags = tags_name - params[:tags]
        deleted_tags.map{|name| 
        tag=Tag.find_by(name: name)
        NoteTag.find_by(tag_id: tag.id, note_id: note.id).destroy
        }
        note.update(title: params[:title],
        content: params[:content])
        note=Note.find(params[:id])
        
        render json: note, include: :tags
    end

    def destroy
        note= Note.find(params[:id])
        note.delete()
        render json:{message: 'note deleted succesful'}
    end

end
