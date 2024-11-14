class CreateFormEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :form_entries do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :phone
      t.date :birthdate
      t.text :notes

      t.timestamps
    end
  end
end
