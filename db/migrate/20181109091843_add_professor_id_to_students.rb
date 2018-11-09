class AddProfessorIdToStudents < ActiveRecord::Migration[5.0]
  def change
    add_reference :students, :professor, foreign_key: true
  end
end
