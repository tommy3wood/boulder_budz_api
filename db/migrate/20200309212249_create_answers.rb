class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :answerable_id
      t.string :answerable_type
      t.text :content

      t.timestamps
    end
  end
end
