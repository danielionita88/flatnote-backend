# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation)



User.create(name: "Daniel")
User.create(name: 'John')
Tag.create(name: 'project')
Tag.create(name: 'something')
Note.create(title: "Project", content: 'Finish the project before New Year!', user_id: 1)
NoteTag.create(tag_id:1, note_id:1)
NoteTag.create(tag_id:1, note_id:2)
NoteTag.create(tag_id:2, note_id:1)

5.times do 
    Note.create(
        title: Faker::Lorem.word,
        content: Faker::Lorem.sentence,
        user_id: 1
        
    )
end

5.times do
    Note.create(
        title: Faker::Lorem.word,
        content: Faker::Lorem.sentence,
        user_id: 2
    )
end