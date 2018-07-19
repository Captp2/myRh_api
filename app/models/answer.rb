class Answer < ApplicationRecord
  belongs_to     :question, dependent: :destroy
  belongs_to     :result, dependent: :destroy
end
