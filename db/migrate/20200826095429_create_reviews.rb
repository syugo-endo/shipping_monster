class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references      :user         ,null: false, foreign_key: true
      t.string          :name
      t.string          :content
      t.integer         :satisfaction_id     , null: false
      t.timestamps
    end
  end
end
