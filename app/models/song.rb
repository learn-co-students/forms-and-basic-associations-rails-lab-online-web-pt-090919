class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def notes_attributes=(note_attrib)
    note_attrib.each do |note|
      if note.length > 0
        note_new = Note.create(content: note)
        self.notes << note_new
      end
    end
  end

  def notes_attributes
    self.notes ? self.notes.all : nil
  end

end
