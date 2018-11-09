class ProfessorsController < ApplicationController

  def assign_student
    professor = Professor.least_students or return render_errors('No professors are found.')
    student       = professor.students.build(student_params)
    student.match = true if student.first_name == professor.first_name

    if student.save
      render_success
    else
      render_errors(student.errors.full_messages)
    end
  end

  def student_params
    params.permit(:first_name, :last_name)
  end

  def render_errors(*errors)
    render(json: { errors: errors }, status: :bad_request)
  end

  def render_success(**data)
    render json: data, status: :ok
  end
end
