class Song < ApplicationRecord
    include ActiveModel::Validations
    validates_with TitleValidator
    validates :released, inclusion: { in: [true, false] }
    validates_with ReleaseYearValidator
    validates :artist_name, presence: true
end