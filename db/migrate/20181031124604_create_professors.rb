class CreateProfessors < ActiveRecord::Migration[5.0]
  def change
    create_table :professors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :student_count, default: 0

      t.timestamps
    end
  end
end
