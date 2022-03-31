class CreateComment < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.string :body
      t.integer :target_id
      t.string :target_type
      t.timestamps
    end
  end
end
