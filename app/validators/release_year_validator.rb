class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        record.released == false ? true : false
    end
end