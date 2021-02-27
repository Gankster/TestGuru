class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :users
  has_many :users, through: :passing_test

  def self.by_category(title)
    Test.joins('LEFT JOIN categories ON tests.category_id = categories.id')
        .where('categories.title = ?', title)
        .order(id: :desc)
  end
end
