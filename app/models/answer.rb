class Answer < ApplicationRecord
  belongsTo     :question, dependent: :destroy
  belongsTo     :result, dependent: :destroy
end
