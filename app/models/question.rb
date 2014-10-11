class Question < ActiveRecord::Base
  attr_accessible :body, :title

  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true
end
