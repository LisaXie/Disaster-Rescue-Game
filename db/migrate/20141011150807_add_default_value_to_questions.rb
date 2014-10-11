class AddDefaultValueToQuestions < ActiveRecord::Migration
  change_column :questions, :user_id, :integer, :default => 0
end
