class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false, default: ""
      t.text :note, null: false, default: ""
      t.datetime :deadline
      t.datetime :completed

      t.timestamps
    end    
  end
end
