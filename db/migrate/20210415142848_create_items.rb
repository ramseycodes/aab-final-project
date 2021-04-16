class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :url
      t.string :category

      t.string :favicon
      t.string :title
      t.string :description
      t.string :image_src

      t.timestamps
    end
  end
end
