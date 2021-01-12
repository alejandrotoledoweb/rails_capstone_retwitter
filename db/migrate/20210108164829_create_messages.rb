class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
    add_index :messages, %i[user_id created_at]
  end
end
