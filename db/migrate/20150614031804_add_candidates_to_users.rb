class AddCandidatesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :candidates, :text, array: true, default: []
  end
end
