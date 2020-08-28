class TitleValidator < ActiveModel::Validator
    def validate(record)
        return false if record.title == nil
        # Cannot be repeated by the same artist in the same year
        t = record.title
        a = record.artist_name
        temp = Song.find_by(title: t, artist_name: a)
        # binding.pry
        # temp ? true : record.errors[:title] << "Artist has already created a song with that title this year!"
    end
end