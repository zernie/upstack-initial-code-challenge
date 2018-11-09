describe 'Professors API', type: :request do
  let!(:professor) { create(:professor) }

  describe 'assign_student' do
    it 'assigns the student to professor' do
      params = {
          first_name: 'John',
          last_name:  'Smith'
      }

      expect {
        post "/professors/assign_student", params

        professor.reload
      }.to change { Student.count }.by(1)
               .and change { professor.student_count }.by(1)

      expect(response).to have_http_status(:ok)
    end
  end
end
