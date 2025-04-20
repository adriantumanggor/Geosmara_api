class CreateContents < ActiveRecord::Migration[7.2]
  def change
    create_table :contents do |t|
      t.references :course_module, null: false, foreign_key: true
      t.text :text
      t.integer :position

      t.timestamps
    end
  end
end
