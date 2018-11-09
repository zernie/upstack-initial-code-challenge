describe 'Professors API', type: :request do
  let!(:professor) { create(:professor) }

  context 'assign_student' do
    describe 'without matching first_name' do
      let(:student) {
        {
            first_name: 'Jane',
            last_name:  'Doe'
        }
      }

      it 'assigns the student to professor' do
        expect {
          post "/professors/assign_student", params: student

          professor.reload
        }.to change { Student.where(match: nil).count }.by(1)
                 .and change { professor.student_count }.by(1)

        expect(response).to have_http_status(:ok)
      end
    end

    describe 'with matching first_name' do
      let(:student) {
        {
            first_name: professor.first_name,
            last_name:  'Smith'
        }
      }

      it 'assigns the student to professor and sets students.match to true' do
        expect {
          post "/professors/assign_student", params: student

          professor.reload
        }.to change { Student.where(match: true).count }.by(1)
                 .and change { professor.student_count }.by(1)

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
