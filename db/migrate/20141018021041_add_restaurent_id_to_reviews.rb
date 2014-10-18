class AddRestaurentIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :restaurent_id, :integer
  end
end
