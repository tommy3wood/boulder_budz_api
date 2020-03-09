class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :category
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
