class Answer < ActiveRecord::Base
  attr_accessible :title, :score, :question_id

  belongs_to :question
end
