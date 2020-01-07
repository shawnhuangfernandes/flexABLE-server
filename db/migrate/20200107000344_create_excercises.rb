class CreateExcercises < ActiveRecord::Migration[6.0]
  def change
    create_table :excercises do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :video_url

      t.timestamps
    end
  end
end
