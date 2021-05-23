class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :FirstName, null: false
      t.string :LastName, null: false
      t.string :EmailId, null: false
      t.timestamps
    end
  end
end
