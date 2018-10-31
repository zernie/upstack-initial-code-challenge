## Setup

Ruby version that will be used in this code challenge is Ruby `2.3.3` along with `Rails 5`.

Code challenge should take one hour.

## General requirements and comments
The functionality that you will be creating in this code challenge is assigning students to professors.

The basic structure of the app is already built. There are student and professor models (with specific fields), route `professor/assign_student`,
MiniTest and RSpec (for your convenience).

**Time limit for the code challenge is one hour**. Try to do the test within that time-frame, and implement only the most important things
to make the functionality work within that time-frame.

The main goal of the code challenge is to see the quality of the code and its correctness.

**After the code challenge is completed** create a branch named: `feat-your-name`, like `feat-john-smith`, push the changes and submit a pull request against `development` branch.


## Code Challenge:
The goal of the code challenge is to extend the existing app with a possibility to assign students to their professors using the specific logic.


- Student details are being sent using POST `/professors/assign_student`, with a format specified in the `POST specification` (this is already implemented)

- Student will be assigned to a professor with the smallest number of students assigned (determined by `student_count` column).
  If professors have the same `student_count`, pick the first one of your choice to assign the student.

- After a student is assigned to a professor, `student_count` for the professor should increase by one.
- If a student has a `first name` the same length as the professor, set `matched` value for the student to `true`.

### API specification:

Students are being assigned to professors by sending a POST request to the url:

    /professors/assign_student

Using the `json` in the request:

```bash
{
  first_name: 'John',
  last_name: 'Smith'
}
```