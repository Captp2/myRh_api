class Quiz < ApplicationRecord
  belongsTo   :offer, dependent: :destroy
  hasMany     :questions
  hasMany     :answer
  hasMany     :results
end
