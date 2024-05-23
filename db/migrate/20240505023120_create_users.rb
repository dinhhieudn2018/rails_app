class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :string
      t.string :password_digest
      t.string :access_token

      t.timestamps
    end
  end
end
