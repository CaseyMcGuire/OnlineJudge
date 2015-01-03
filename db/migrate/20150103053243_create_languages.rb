class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.belongs_to :submission, index:true

      t.timestamps
    end
  end
end
