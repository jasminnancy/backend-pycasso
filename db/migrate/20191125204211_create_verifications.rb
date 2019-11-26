class CreateVerifications < ActiveRecord::Migration[6.0]
  def change
    create_table :verifications do |t|
      t.integer :user_id
      t.boolean :approved, default: false
      t.boolean :finished, default: false

      t.timestamps
    end
  end
end
