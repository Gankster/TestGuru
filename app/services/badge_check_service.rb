# frozen_string_literal: true

class BadgeCheckService
  attr_reader :user, :passing_test

  def initialize(user, passing_test)
    @user = user
    @passing_test = passing_test
  end

  def call
    received_badges = []
    Badge.all.each do |badge|
      received_badges << badge if send("passed_#{badge.rule.kind}?", badge.rule.value)
    end
    user.badges.push(received_badges)
    received_badges.map(&:name)
  end

  private

  def passed_first_try?(_value)
    user.passing_tests.where(test: passing_test.test).count == 1
  end

  def passed_all_tests_by_category?(category_id)
    category = Category.find_by(id: category_id)
    return false if category.blank?
    return false if category.id != passing_test.test.category_id

    passed_test_ids = passed_tests.in_category(category).pluck(:test_id)

    passed_test_ids == category.tests.order(:id).ids
  end

  def passed_all_tests_by_level?(level)
    return false if level.blank?
    return false unless level == passing_test.test.level

    passed_test_ids = passed_tests.by_level(level).pluck(:test_id)

    passed_test_ids == Test.level(level).order(:id).ids
  end

  def passed_tests
    user.passing_tests.succeeded.distinct(:test_id).order(:test_id)
  end
end
