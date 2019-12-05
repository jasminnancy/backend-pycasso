class AddFeaturePhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :feature_one, :string
    add_column :users, :feature_two, :string
    add_column :users, :feature_three, :string
  end
end
