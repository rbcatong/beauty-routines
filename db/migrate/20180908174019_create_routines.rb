class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.text :routine_content
      t.text :routine_days
      t.text :routine_name
      t.integer :user_id
    end
  end
end
