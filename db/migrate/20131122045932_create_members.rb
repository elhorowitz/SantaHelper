class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :usrname
      t.string :password
      t.string :email
      t.references :family, index: true

      t.timestamps
    end
  end
end
