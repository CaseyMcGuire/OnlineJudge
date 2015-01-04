class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :code
      t.integer :language_id
      t.integer :status_id
      t.integer :problem_id
      t.integer :user_id
      t.boolean :completed, default: false, null: false
      t.timestamps
    end
  end
end
