class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name, null: false
      t.string :contact, null: false
      t.string :referrer
      t.inet :ip
      t.string :message, null: false

      t.timestamps null: false
    end
  end
end
