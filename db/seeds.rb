# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  first_name: 'Marcelo',
  last_name: 'Ribeiro',
  email: 'me@marceloribeiro.us',
  password: 'change123',
  password_confirmation: 'change123'
)

def create_standard_answers_for_question(q)
  q.assessment_answers.create!(
    answer: 'Not at all',
    order_number: 1
  )
  q.assessment_answers.create!(
    answer: 'Several Days',
    order_number: 2
  )
  q.assessment_answers.create!(
    answer: 'More than half the days',
    order_number: 3
  )
  q.assessment_answers.create!(
    answer: 'Nearly every day',
    order_number: 4
  )
end

questions = [
  'Little interest or pleasure in doing things',
  'Feeling down, depressed, or hopeless',
  'Trouble falling or staying asleep, or sleeping too much',
  'Feeling tired or having little energy',
  'Poor appetite or overeating',
  'Feeling bad about yourself—or that you are a failure or have '\
  'let yourself or your family down',
  'Trouble concentrating on things, such as reading the newspaper or watching '\
  'television',
  'Moving or speaking so slowly that other people could have noticed? Or the '\
  'opposite—being so fidgety or restless that you have been moving around '\
  'a lot more than usual',
  'Thoughts that you would be better off dead or of hurting yourself '\
  'in some way',
  'If you checked off any problems, how difficult have these problems made it '\
  'for you to do your work, take care of things at home, or get along with '\
  'other people?'
]

questions.each_with_index do |question, index|
  q = AssessmentQuestion.create(
    title: question,
    order_number: index + 1
  )
  create_standard_answers_for_question(q)
end
