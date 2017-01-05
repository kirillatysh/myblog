class CreateRubrics < ActiveRecord::Migration
  def change
    create_table :rubrics do |t|
      t.string :title
      t.timestamps null: false
    end
  end
end
