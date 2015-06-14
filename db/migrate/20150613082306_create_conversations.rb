class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :senderID
      t.integer :recipientID

      t.timestamps null: false
    end
  end
end
