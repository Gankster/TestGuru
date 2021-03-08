# frozen_string_literal: true

module PassingTestsHelper
  def result_percent_color(passing_test)
    percent = passing_test.result_percent
    if passing_test.test_passed?
      "<span style='color: green'>#{percent}%</span>".html_safe
    else
      "<span style='color: red'>#{percent}%</span>".html_safe
    end
  end
end
