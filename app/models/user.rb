class User < ActiveRecord::Base
  attr_accessible :total_score

  has_many :questions

  def place
    total_users = User.all.count
    users_with_more = User.where("total_score < ?", total_score).count
    return total_users - users_with_more
  end

  def self.all_ordered_by_position
    all.sort_by! do |user|
      user.place
    end
  end
end
