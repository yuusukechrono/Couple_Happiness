class Plan < ApplicationRecord
  belongs_to :user

  def plan_set
    plan_date.strftime("%y年%m月%d日")
  end

  validate :pretend_ago

  def pretend_ago()
      errors.add(:plan_date, '日付が過去です') if plan_date < Date.today
  end

end

