class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.text :routine_content
      t.integer :user_id
    end
  end
end
