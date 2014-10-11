class Answer < ActiveRecord::Base
  attr_accessible :title, :score, :question_id, :body

  belongs_to :question
end
