class CreatePoems < ActiveRecord::Migration[7.1]
  def change
    create_table :poems do |t|
      t.string :title
      t.string :writer
      t.text   :body
      t.string :language
      t.date   :released

      t.timestamps
    end
  end
end
