describe 'Professors API', type: :request do
  let!(:professor) { create(:professor) }
  let!(:another_professor) { create(:professor, student_count: 10) }

  context 'assign_student' do
    let!(:url) { "/professors/assign_student" }

    describe 'without matching first_name' do
      let(:student) {
        {
            first_name: 'John',
            last_name:  'Smith'
        }
      }

      it 'assigns the student to professor' do
        expect {
          post url, params: student

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
          post url, params: student

          professor.reload
        }.to change { Student.where(match: true).count }.by(1)
                 .and change { professor.student_count }.by(1)

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
