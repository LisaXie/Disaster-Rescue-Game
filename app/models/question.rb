class Question < ActiveRecord::Base
  attr_accessible :body, :title, :image_link, :answers_attributes, :user_id

  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true
  belongs_to :user

  def self.random_unanswered_question(user_id)
    where('user_id <> ?', user_id).order("RANDOM()").first
  end
end
