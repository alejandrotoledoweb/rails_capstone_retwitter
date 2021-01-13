class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :username
      t.string :email
      t.string :photo
      t.string :cover_image

      t.timestamps
    end
  end
end
