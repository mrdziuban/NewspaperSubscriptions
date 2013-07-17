class CreateNewspapers < ActiveRecord::Migration
  def change
    create_table :newspapers do |t|
      t.string :title
      t.integer :editor

      t.timestamps
    end

    add_index :newspapers, :editor
  end
end
