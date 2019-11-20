class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.integer :user_id
      t.text :content
      t.integer :hearts, default: 0
      
      t.timestamps
    end
  end
end
