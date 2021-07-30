class CreateVinyls < ActiveRecord::Migration[6.1]
  def change
    create_table :vinyls do |t|
      t.string :name
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
