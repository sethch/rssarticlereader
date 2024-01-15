class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :link
      t.string :creator
      t.datetime :date
      t.string :subject

      t.timestamps
    end
  end
end
