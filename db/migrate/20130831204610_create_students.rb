class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :identification, null: false
      t.string :kind, limit: 1

      t.timestamps
    end

    add_index :students, :lastname
    add_index :students, :identification, unique: true
  end
end
