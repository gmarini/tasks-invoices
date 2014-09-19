class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :task, index: true
      t.string :summary, null: false, default: ""
      t.text :description, default: ""
      t.datetime :start
      t.datetime :finish
      t.float :rate

      t.timestamps
    end
  end  
end
