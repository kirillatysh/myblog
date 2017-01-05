class CreateCmmnts < ActiveRecord::Migration
  def change
    create_table :cmmnts do |t|
      t.text :body
      t.references :post, index: true

      t.timestamps
    end
  end
end
