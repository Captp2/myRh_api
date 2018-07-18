class Question < ApplicationRecord
  belongsTo   :quiz, dependent: :destroy
  hasMany     :answer
end
