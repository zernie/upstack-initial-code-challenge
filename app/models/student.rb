class Student < ApplicationRecord
  belongs_to :professor, counter_cache: :student_count
end
