class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :problem_id
      t.text :expected_result
      t.text :input

      t.timestamps
    end
  end
end
