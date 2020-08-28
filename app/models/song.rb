class Song < ApplicationRecord
    validates :artist_name, :title, presence: true
    validates :release_year, allow_blank: true, numericality: { only_integer: true, less_than: 2021 } # DateTime.new.year
    validate :release_year_check

    # Song is invalid if an artist tries to release the same song twice in a year
    def release_year_check
        if self && self.released && self.release_year == nil
            self.errors.add(:release_year, "must contain a year if the song has been released.")
        elsif Song.find_by(title: self.title, artist_name: self.artist_name, release_year: self.release_year)
            self.errors.add(:title, "cannot be the same as another title released this year by this artist.")
        end
    end

end