class CreateUserDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :user_diaries do |t|
      t.string :content
      t.string :url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
