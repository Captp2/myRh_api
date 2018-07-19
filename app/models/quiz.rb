class Quiz < ApplicationRecord
  belongs_to   :offer, dependent: :destroy
  has_many     :questions
  has_many     :answer
  has_many     :results
end
