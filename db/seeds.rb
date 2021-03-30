# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.find_by(email: 'admin@testguru.com') || Admin.create(
  email: 'admin@testguru.com',
  password: '123456',
  first_name: 'Admin',
  last_name: 'Super'
)

categories = Category.create([
                               { title: 'Frontend' },
                               { title: 'Backend' },
                               { title: 'Mobile' }
                             ])

tests = Test.create([
                      { title: 'HTML', category: categories[0], author: admin },
                      { title: 'JavaScript', level: 1, category: categories[0], author: admin },
                      { title: 'Ruby', level: 2, category: categories[1], author: admin },
                      { title: 'Java', level: 3, category: categories[1], author: admin },
                      { title: 'Android', level: 2, category: categories[2], author: admin }
                    ])

questions = Question.create([
                              { body: 'What html tag creates the input field?', test: tests[0] },
                              { body: 'What will return the parseInt("08") function call?', test: tests[1] },
                              { body: 'Which company developed JavaScript?', test: tests[1] },
                              { body: 'What does this return? "hello".upcase()', test: tests[2] },
                              { body: 'What does the following code return? [:a, :b, :c].include?(:a)',
                                test: tests[2] },
                              { body: 'Is it possible to dynamically change an array size?', test: tests[3] },
                              { body: 'Which company developed android?', test: tests[4] }
                            ])

Answer.create([
                { body: '<text>', question: questions[0] },
                { body: '<select>', question: questions[0] },
                { body: '<input>', correct: true, question: questions[0] },

                { body: 'Depends on the browser engine', correct: true, question: questions[1] },
                { body: '08', question: questions[1] },
                { body: '8', question: questions[1] },

                { body: 'Apple', question: questions[2] },
                { body: 'Netscape', correct: true, question: questions[2] },
                { body: 'Sun Microsystems', question: questions[2] },

                { body: 'Hello', question: questions[3] },
                { body: 'HeLlo', question: questions[3] },
                { body: 'HELLO', correct: true, question: questions[3] },

                { body: 'false', question: questions[4] },
                { body: 'true', correct: true, question: questions[4] },
                { body: 'nil', question: questions[4] },

                { body: 'No', correct: true, question: questions[5] },
                { body: 'Yes', question: questions[5] },

                { body: 'Android Inc.', question: questions[6] },
                { body: 'Google', correct: true, question: questions[6] },
                { body: 'Apple', question: questions[6] }
              ])

User.create([
              { email: 'user1@gmail.com', password: 'password1', first_name: 'Bob', last_name: 'Smit' },
              { email: 'user2@gmail.com', password: 'password2', first_name: 'Jack', last_name: 'Roof' }
            ])

BadgeRule.create(
  [
    { name: 'Successful passing of all frontend tests', kind: 1, value: categories[0].id },
    { name: 'Successful passing of all backend tests', kind: 1, value: categories[1].id },
    { name: 'Successful passing of all mobile tests', kind: 1, value: categories[2].id },
    { name: 'Successful passing of all level 1 tests', kind: 2, value: 1 },
    { name: 'Successful passing of all level 2 tests', kind: 2, value: 2 },
    { name: 'Successful passing of all level 3 tests', kind: 2, value: 3 },
    { name: 'Successfully passing the test on the first try', kind: 0, value: 0 }
  ]
)
