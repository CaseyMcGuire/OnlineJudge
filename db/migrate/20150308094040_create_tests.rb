class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.text :starter_code
      t.text :test_code
      t.integer :problem_id
      t.integer :language_id

      t.timestamps
    end
  end
end
