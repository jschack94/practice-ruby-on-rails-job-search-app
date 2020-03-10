class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.datetime :created_on
      t.string :profile_picture
      t.string :bio
      t.string :uid

      t.timestamps
    end
  end
end
