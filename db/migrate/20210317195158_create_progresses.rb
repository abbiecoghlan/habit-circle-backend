class CreateProgresses < ActiveRecord::Migration[6.1]
  def change
    create_table :progresses do |t|
      t.integer :habit_id
      t.integer :day_id
      t.boolean :completed, default: false 

      t.timestamps
    end
  end
end
