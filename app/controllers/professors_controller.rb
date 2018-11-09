class ProfessorsController < ApplicationController

  def assign_student
    professor = Professor.least_students
    return render_errors('No professors are found.') unless professor

    student = professor.students.build(student_params)

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
