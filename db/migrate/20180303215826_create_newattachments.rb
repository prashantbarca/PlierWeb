class CreateNewattachments < ActiveRecord::Migration[5.1]
  def change
    create_table :newattachments do |t|
      t.string :name

      t.timestamps
    end
  end
end
