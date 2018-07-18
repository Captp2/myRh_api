class Result < ApplicationRecord
  belongsTo     :user, dependent: :destroy
  belongsTo     :question, dependent: :destroy
  belongsTo     :answer, dependent: :destroy
end
