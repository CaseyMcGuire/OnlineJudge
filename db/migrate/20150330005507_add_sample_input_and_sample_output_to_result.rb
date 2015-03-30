class AddSampleInputAndSampleOutputToResult < ActiveRecord::Migration
  def change
    add_column :results, :sample_input, :text
    add_column :results, :sample_output, :text
  end
end
