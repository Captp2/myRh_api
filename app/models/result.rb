class Result < ApplicationRecord
  belongs_to     :user, dependent: :destroy
  belongs_to     :question, dependent: :destroy
  belongs_to     :answer, dependent: :destroy
end
