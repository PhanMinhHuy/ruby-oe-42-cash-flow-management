class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.integer :role, default: 0
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
