# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
                               { title: 'Frontend' },
                               { title: 'Backend' },
                               { title: 'Mobile' }
                             ])

tests = Test.create([
                      { title: 'HTML', category_id: categories[0].id },
                      { title: 'JavaScript', level: 1, category_id: categories[0].id },
                      { title: 'Ruby', level: 2, category_id: categories[1].id },
                      { title: 'Java', level: 3, category_id: categories[1].id },
                      { title: 'Android', level: 2, category_id: categories[2].id }
                    ])

questions = Question.create([
                              { body: 'What html tag creates the input field?',
                                test_id: tests[0].id },
                              { body: 'What will return the parseInt("08") function call?',
                                test_id: tests[1].id },
                              { body: 'Which company developed JavaScript?', test_id: tests[1].id },
                              { body: 'What does this return? "hello".upcase()',
                                test_id: tests[2].id },
                              {
                                body: 'What does the following code return? [:a, :b, :c].include?(:a)', test_id: tests[2].id
                              },
                              { body: 'Is it possible to dynamically change an array size?',
                                test_id: tests[3].id },
                              { body: 'Which company developed android?', test_id: tests[4].id }
                            ])

Answer.create([
                { body: '<text>', question_id: questions[0].id },
                { body: '<select>', question_id: questions[0].id },
                { body: '<input>', correct: true, question_id: questions[0].id },

                { body: 'Depends on the browser engine', correct: true,
                  question_id: questions[1].id },
                { body: '08', question_id: questions[1].id },
                { body: '8', question_id: questions[1].id },

                { body: 'Apple', question_id: questions[2].id },
                { body: 'Netscape', correct: true, question_id: questions[2].id },
                { body: 'Sun Microsystems', question_id: questions[2].id },

                { body: 'Hello', question_id: questions[3].id },
                { body: 'HeLlo', question_id: questions[3].id },
                { body: 'HELLO', correct: true, question_id: questions[3].id },

                { body: 'false', question_id: questions[4].id },
                { body: 'true', correct: true, question_id: questions[4].id },
                { body: 'nil', question_id: questions[4].id },

                { body: 'No', correct: true, question_id: questions[5].id },
                { body: 'Yes', question_id: questions[5].id },

                { body: 'Android Inc.', question_id: questions[6].id },
                { body: 'Google', correct: true, question_id: questions[6].id },
                { body: 'Apple', question_id: questions[6].id }
              ])

users = User.create([
                      { email: 'user1@gmail.com', password: 'password1', name: 'User1' },
                      { email: 'user2@gmail.com', password: 'password2', name: 'User2' }
                    ])

PassingTest.create([
                     { user_id: users[0].id, test_id: tests[0].id },
                     { user_id: users[0].id, test_id: tests[2].id },
                     { user_id: users[0].id, test_id: tests[4].id, passed: true },
                     { user_id: users[1].id, test_id: tests[0].id },
                     { user_id: users[1].id, test_id: tests[1].id },
                     { user_id: users[1].id, test_id: tests[3].id, passed: true }
                   ])
