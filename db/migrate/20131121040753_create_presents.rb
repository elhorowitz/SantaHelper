class CreatePresents < ActiveRecord::Migration
  def change
    create_table :presents do |t|
      t.text :label
      t.string :santa
      t.boolean :bought
      t.references :member, index: true

      t.timestamps
    end
  end
end
