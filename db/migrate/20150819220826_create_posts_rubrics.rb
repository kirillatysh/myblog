class CreatePostsRubrics < ActiveRecord::Migration
  def change
    create_table :posts_rubrics, id: false do |t|
      t.integer :post_id
      t.integer :rubric_id
    end
  end
end
