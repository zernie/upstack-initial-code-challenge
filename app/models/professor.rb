class Professor < ApplicationRecord
  has_many :students

  def self.least_students
    order('student_count ASC').first
  end
end
