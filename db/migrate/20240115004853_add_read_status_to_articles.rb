class AddReadStatusToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :read_status, :boolean
  end
end
