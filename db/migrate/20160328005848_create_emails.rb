class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :user_id
      t.string :from_email
      t.string :to_email
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
  end
end
