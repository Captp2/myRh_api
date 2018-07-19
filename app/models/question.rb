class Question < ApplicationRecord
  belongs_to   :quiz, dependent: :destroy
  has_many     :answer
end
