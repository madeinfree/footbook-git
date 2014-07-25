class AddPointsCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :post_points_count, :integer, :default => 0
  end
end
