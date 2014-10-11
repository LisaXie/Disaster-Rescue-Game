class AddImageLinkToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :image_link, :string
  end
end
