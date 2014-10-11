class Question < ActiveRecord::Base
  attr_accessible :body, :title, :image_link, :answers_attributes

  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true
end
