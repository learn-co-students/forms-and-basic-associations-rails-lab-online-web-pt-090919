class Song < ActiveRecord::Base
  
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

  def notes_attributes=(tribs)
    tribs.each do |trib|
      if trib.length > 0
        note = Note.create(content: trib)
        self.notes << note
      end
    end
  end

  def notes_attributes
    self.notes ? self.notes.all : nil
  end

end
